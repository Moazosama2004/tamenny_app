import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_styles.dart';
import '../utils/app_assets.dart';

AppBar customAppBar(
  BuildContext context, {
  required String title,
  List<Widget>? actions,
  bool leadingIcon = true,
  Color? backgroundColor,
  Color? titleColor,
}) {
  return AppBar(
    backgroundColor: backgroundColor ?? Colors.white,
    surfaceTintColor: Colors.transparent,
    elevation: 0.0,
    centerTitle: true,
    leading: Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: leadingIcon
            ? SvgPicture.asset(
                Assets.imagesPopIcon,
                width: 30,
                height: 30,
              )
            : null,
      ),
    ),
    title: Text(
      title,
      style: AppStyles.font18SemiBold
          .copyWith(color: titleColor ?? const Color(0xff242424)),
    ),
    actions: actions,
  );
}
