import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/utils/app_assets.dart';

class HealthScanItemWidget extends StatelessWidget {
  const HealthScanItemWidget({super.key});

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
              Assets.imagesBrainIcon,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Lungs',
            style: AppStyles.font12Regular,
          ),
        ],
      ),
    );
  }
}
