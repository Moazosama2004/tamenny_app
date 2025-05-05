import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tamenny_app/core/theme/app_styles.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';
import 'package:tamenny_app/features/community/domain/entites/post_entity.dart';
import 'package:tamenny_app/features/community/presentation/views/post_details_view.dart';
import 'package:tamenny_app/features/community/presentation/views/widgets/post_actions.dart';

class Post extends StatelessWidget {
  const Post({super.key, required this.post});
  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    // final communityCubit = context.read<CommunityCubit>();
    // final isLiked = communityCubit.isPostLiked(post);

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundImage: NetworkImage(post.userAvatarUrl),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              post.username,
                              style: AppStyles.font13Bold,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              _getTimeAgo(post.createdAt),
                              style: AppStyles.font13Bold,
                            ),
                          ],
                        ),
                        SvgPicture.asset(Assets.imagesMoreOptionIcon)
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      post.postText,
                      style: AppStyles.font12Regular,
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
              likesCount: post.likesCount,
              sharesCount: post.sharesCount,
              isLiked: false,
              post: post,
              // isLiked: isLiked,
              // onLikePressed: () => communityCubit.toggleLike(post.postId),
            ),
          ],
        ),
      ),
    );
  }

  String _getTimeAgo(Timestamp timestamp) {
    final DateTime dateTime = timestamp.toDate();
    final Duration difference = DateTime.now().difference(dateTime);
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${(difference.inDays / 7).floor()} weeks ago';
    }
  }
}
