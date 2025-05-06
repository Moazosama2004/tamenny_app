import 'package:flutter/material.dart';
import 'package:tamenny_app/features/scan/presentation/views/functions/build_benefit_item.dart';

import '../../../../../core/theme/app_styles.dart';

Widget buildBenefitsSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Why Choose Tamenny for Your Scan Analysis?',
        style: AppStyles.font20SemiBold,
      ),
      const SizedBox(height: 16),
      buildBenefitItem(
        icon: Icons.shield_outlined,
        text: 'Trusted AI-powered analysis with high accuracy.',
      ),
      const SizedBox(height: 10),
      buildBenefitItem(
        icon: Icons.timer_outlined,
        text: 'Get results in minutes, saving time and effort.',
      ),
      const SizedBox(height: 10),
      buildBenefitItem(
        icon: Icons.directions_walk_outlined,
        text: 'Guidance on next steps to manage your lung health.',
      ),
    ],
  );
}
