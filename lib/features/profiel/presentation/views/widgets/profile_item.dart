import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.text, required this.image, required this.backgroundColor, this.onTap});
  final String text;
  final String image;
  final Color backgroundColor;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            color:  backgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(8),
          child: SvgPicture.asset(
            image,
          ),
        ),
        title: Text(text),
      ),
    );
  }
}
