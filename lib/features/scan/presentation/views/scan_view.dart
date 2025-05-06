import 'package:flutter/material.dart';
import 'package:tamenny_app/core/routes/routes.dart';
import 'package:tamenny_app/core/theme/app_styles.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';
import 'package:tamenny_app/core/widgets/custom_app_bar.dart';
import 'package:tamenny_app/core/widgets/custom_app_button.dart';
import 'package:tamenny_app/features/scan/domain/entites/scan_details_entity.dart';
import 'package:tamenny_app/features/scan/presentation/views/widgets/scan_view_body.dart';

import 'functions/build_benefits_sections.dart';
import 'functions/build_step_indicator.dart';

class ScanView extends StatelessWidget {
  const ScanView({
    super.key,
    required this.scanDetailsEntity,
  });
  final ScanDetailsEntity scanDetailsEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          customAppBar(context, title: '${scanDetailsEntity.analysisTitle}'),
      body: ScanViewBody(
        scan: scanDetailsEntity,
      ),
    );
  }
}
