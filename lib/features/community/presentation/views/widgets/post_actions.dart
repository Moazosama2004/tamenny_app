import 'package:flutter/material.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';
import 'package:tamenny_app/features/community/presentation/views/widgets/post_action.dart';

class PostActions extends StatelessWidget {
  const PostActions({
    super.key,
    required this.commentsCount,
    required this.likesCount,
    required this.sharesCount,
    required this.viewsCount,
  });
  final int commentsCount;
  final int likesCount;
  final int sharesCount;
  final int viewsCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: PostAction(
          counts: commentsCount,
          iconPath: Assets.imagesCommentIcon,
        )),
        Expanded(
            child: PostAction(
          counts: likesCount,
          iconPath: Assets.imagesLoveIcon,
        )),
        Expanded(
            child: PostAction(
          counts: sharesCount,
          iconPath: Assets.imagesShareIcon,
        )),
      ],
    );
  }
}
