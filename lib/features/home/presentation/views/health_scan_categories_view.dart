import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tamenny_app/core/routes/routes.dart';
import 'package:tamenny_app/core/theme/app_styles.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class HealthScanCategoriesView extends StatelessWidget {
  const HealthScanCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Health Scan Categories'),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 32.0,
          crossAxisSpacing: 8.0,
        ),
        padding: const EdgeInsets.only(
          top: 42,
          left: 16,
          right: 16,
        ), // padding around the grid
        itemCount: 12, // total number of items
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.scanView);
                },
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: const Color(0xffF4F8FF),
                  child: SvgPicture.asset(
                    Assets.imagesCardiologistIcon,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'General',
                style: AppStyles.font12Regular,
              ),
            ],
          );
        },
      ),
    );
  }
}
