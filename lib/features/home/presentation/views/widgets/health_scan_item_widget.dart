
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tamenny_app/features/home/domain/entites/health_scan_category_entity.dart';
import 'package:tamenny_app/features/scan/domain/entites/scan_details_entity.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/theme/app_styles.dart';

class HealthScanItemWidget extends StatelessWidget {
  const HealthScanItemWidget(
      {super.key,
      required this.healthScanCategoryEntity,
      required this.selectedWidgetIndex});
  final HealthScanCategoryEntity healthScanCategoryEntity;
  final int selectedWidgetIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).pushNamed(Routes.scanView,
            arguments: scansDetails[selectedWidgetIndex]);
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

List<ScanDetailsEntity> scansDetails = [
  const ScanDetailsEntity(
    analysisTitle: 'Heart Disease Analysis',
    analysisType: 'heart',
    analysisGuidanceMessages:
        "Our AI will analyze your heart scan, detect potential cardiovascular risks, and suggest preventive or corrective measures.",
  ),
  const ScanDetailsEntity(
    analysisTitle: 'Lung Cancer',
    analysisType: 'lung',
    analysisGuidanceMessages:
        "Our AI will highlight issues, detect early-stage lung conditions like COPD, and provide guidance on the next steps.",
  ),
  const ScanDetailsEntity(
    analysisTitle: 'Brain Cancer',
    analysisType: 'brain',
    analysisGuidanceMessages:
        "Our AI will examine your brain scan, identify signs of abnormal growth or tumors, and assist you with expert-backed next steps.",
  ),
  const ScanDetailsEntity(
      analysisGuidanceMessages:
          "Our AI will assess your knee joint, detect signs of osteoarthritis or degeneration, and offer recommendations to manage symptoms early.",
      analysisTitle: 'Knee Osteoarthritis (OA)',
      analysisType: 'knee'),
];
