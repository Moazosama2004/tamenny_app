import 'package:flutter/material.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';
import 'package:tamenny_app/features/home/domain/entites/health_scan_category_entity.dart';

import 'health_scan_categories_header_widget.dart';
import 'health_scan_item_widget.dart';

class HealthScanCategoriesWidget extends StatelessWidget {
  const HealthScanCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HealthScanCategoriesHeaderWidget(),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: List.generate(
            categories.length,
            (index) => Expanded(
              child: HealthScanItemWidget(
                  healthScanCategoryEntity: categories[index]),
            ),
          ),
        ),
      ],
    );
  }
}

List<HealthScanCategoryEntity> categories = [
  HealthScanCategoryEntity(
    title: "Heart",
    image: Assets.imagesHeartIcon,
  ),
  HealthScanCategoryEntity(
    title: "Lung Cancer",
    image: Assets.imagesLungsIcon,
  ),
  HealthScanCategoryEntity(
    title: "Brain Cancer",
    image: Assets.imagesBrainIcon,
  ),
  HealthScanCategoryEntity(
    title: "Knee OA",
    image: Assets.imagesBoneIcon,
  ),
];
