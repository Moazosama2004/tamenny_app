import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostAction extends StatelessWidget {
  const PostAction({
    super.key,
    required this.iconPath,
    required this.counts,
    this.onTap,
  });

  final String iconPath;
  final int counts;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: SvgPicture.asset(
            iconPath,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '$counts',
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
