import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostAction extends StatefulWidget {
  const PostAction({
    super.key,
    required this.iconPath,
    this.activeColor = Colors.red,
    this.defaultColor = Colors.grey,
    this.activeIconPath,
    required this.counts,
  });

  final String iconPath;
  final String? activeIconPath;
  final Color activeColor;
  final Color defaultColor;
  final int counts;

  @override
  State<PostAction> createState() => _PostActionState();
}

class _PostActionState extends State<PostAction> {
  bool isActive = false;

  void toggle() {
    setState(() {
      isActive = !isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: toggle,
          child: SvgPicture.asset(
            isActive && widget.activeIconPath != null
                ? widget.activeIconPath!
                : widget.iconPath,
            colorFilter: ColorFilter.mode(
              isActive ? widget.activeColor : widget.defaultColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        const SizedBox(width: 4),
        Text('${widget.counts}'), // Just a demo, can be passed as a prop
      ],
    );
  }
}
