import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';

class ArrowIcon extends StatelessWidget {
  const ArrowIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.imagesProfileArrowGoIcon,
      width: 12,
      height: 12,
      colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
    );
  }
}
