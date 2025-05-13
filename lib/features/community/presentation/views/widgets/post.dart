import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tamenny_app/core/cubits/user_cubit/user_cubit.dart';
import 'package:tamenny_app/core/theme/app_styles.dart';
import 'package:tamenny_app/features/community/domain/entites/post_entity.dart';
import 'package:tamenny_app/features/community/presentation/manager/community_cubit/community_cubit.dart';
import 'package:tamenny_app/features/community/presentation/views/post_details_view.dart';
import 'package:tamenny_app/features/community/presentation/views/widgets/post_actions.dart';
import 'package:tamenny_app/features/community/presentation/views/widgets/post_header.dart';

class Post extends StatelessWidget {
  const Post({super.key, required this.post});
  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    String currentUserId = context.read<UserCubit>().currentUser!.uId;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xffEEEEEE),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PostDetailsView(post: post),
                  ),
                );
              },
              child: Container(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PostHeader(post: post),
                    const SizedBox(height: 8),
                    Text(
                      post.postText,
                      style: AppStyles.font13Regular
                          .copyWith(color: const Color(0xff676767)),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 18),
                    if (post.imageUrl!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl: post.imageUrl!,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Skeletonizer(
                              enabled: true,
                              child: Container(
                                width: double.infinity,
                                // height: MediaQuery.of(context).size.width *
                                //     2 /
                                //     3, // same as 3:2 aspect
                                color: Colors.grey[850],
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Center(child: Icon(Icons.error)),
                          ),
                        ),
                      ),
                    const SizedBox(height: 18),
                  ],
                ),
              ),
            ),
            PostActions(
              commentsCount: post.commentsCount,
              likesCount: post.likedBy.length,
              sharesCount: post.sharesCount,
              isLiked: post.likedBy.contains(currentUserId),
              onLikePressed: () async {
                // إضافة الـ Like أو إزالته
                await context
                    .read<CommunityCubit>()
                    .likePost(post: post, userId: currentUserId);

                // بعد إضافة الـ Like في الـ Backend، نقوم بتحديث الـ UI مباشرة
                context.read<CommunityCubit>().toggleLikeInPost(
                      postId: post.postId,
                      userId: currentUserId,
                    );
              },
              post: post,
            ),
          ],
        ),
      ),
    );
  }
}
