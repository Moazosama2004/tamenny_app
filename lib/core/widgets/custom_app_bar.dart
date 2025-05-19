import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tamenny_app/core/theme/app_colors.dart';
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
  final theme = Theme.of(context);

  return AppBar(
    backgroundColor: backgroundColor ?? theme.scaffoldBackgroundColor,
    surfaceTintColor: Colors.transparent,
    elevation: 0.0,
    centerTitle: true,
    leading: leadingIcon
        ? GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
              child: SvgPicture.asset(
                Assets.imagesPopIcon,
                width: 30,
                height: 30,
                color: theme.iconTheme.color, // adapts to dark/light mode
              ),
            ),
          )
        : null,
    title: Text(
      title,
      style: AppStyles.font18SemiBold.copyWith(
        color: titleColor ?? theme.textTheme.bodyLarge?.color,
      ),
    ),
    actions: actions,
  );
}
