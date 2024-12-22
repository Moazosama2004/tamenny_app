import 'package:flutter/material.dart';

import 'health_scan_categories_header_widget.dart';
import 'health_scan_item_widget.dart';

class HealthScanCategoriesWidget extends StatelessWidget {
  const HealthScanCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HealthScanCategoriesHeaderWidget(),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(child: HealthScanItemWidget()),
            Expanded(child: HealthScanItemWidget()),
            Expanded(child: HealthScanItemWidget()),
            Expanded(child: HealthScanItemWidget()),
          ],
        ),
      ],
    );
  }
}
