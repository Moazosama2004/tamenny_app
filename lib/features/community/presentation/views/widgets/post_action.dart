import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostAction extends StatelessWidget {
  const PostAction({
    super.key,
    required this.iconPath,
    this.activeColor = Colors.red,
    this.defaultColor = Colors.grey,
    this.activeIconPath,
    required this.counts,
    this.isLiked = false,
    this.onLikePressed,
  });

  final String iconPath;
  final String? activeIconPath;
  final Color activeColor;
  final Color defaultColor;
  final int counts;
  final bool isLiked;
  final VoidCallback? onLikePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onLikePressed,
          child: iconPath.contains('love')
              ? Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? activeColor : defaultColor,
                  size: 24,
                )
              : SvgPicture.asset(
                  isLiked && activeIconPath != null
                      ? activeIconPath!
                      : iconPath,
                  colorFilter: ColorFilter.mode(
                    isLiked ? activeColor : defaultColor,
                    BlendMode.srcIn,
                  ),
                ),
        ),
        const SizedBox(width: 4),
        Text(
          '$counts',
          style: TextStyle(
            color: isLiked ? activeColor : defaultColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
