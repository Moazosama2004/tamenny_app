import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: AspectRatio(
                            aspectRatio: 3 / 2,
                            child: Image.network(
                              post.imageUrl!,
                              fit: BoxFit.cover,
                            ),
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
