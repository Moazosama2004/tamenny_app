import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tamenny_app/features/home/domain/entites/health_scan_category_entity.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/theme/app_styles.dart';

class HealthScanItemWidget extends StatelessWidget {
  const HealthScanItemWidget(
      {super.key, required this.healthScanCategoryEntity});
  final HealthScanCategoryEntity healthScanCategoryEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log('Navigating to: ${Routes.healthScanCategoriesView}');
        Navigator.of(context, rootNavigator: true).pushNamed(Routes.scanView);
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: const Color(0xffF4F8FF),
            child: SvgPicture.asset(
              healthScanCategoryEntity.image,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            healthScanCategoryEntity.title,
            style: AppStyles.font12Regular,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
