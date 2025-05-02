
import 'package:flutter/material.dart';
import '../../../../../core/theme/app_styles.dart';

class HealthScanCategoriesHeaderWidget extends StatelessWidget {
  const HealthScanCategoriesHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Health Scan Categories',
          style: AppStyles.font18SemiBold,
        ),
      ],
    );
  }
}
