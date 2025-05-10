import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamenny_app/features/scan/presentation/manager/cubit/dianosis_cubit.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_app_button.dart';

class ScanAnalysisResults extends StatelessWidget {
  const ScanAnalysisResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Scan Analysis Results'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Image.asset(Assets.imagesScanResult),
            const SizedBox(height: 20),

            // Diagnosis Summary
            _sectionTitle('Test'),
            _sectionBody(
                'result => ${context.read<DiagnosisCubit>().diagnosisResultEntity.classification} \n conf => ${context.read<DiagnosisCubit>().diagnosisResultEntity.confidence} '),
            _sectionTitle('Diagnosis Summary'),
            _sectionBody(
                'Diagnosed Condition: Potential Early-Stage Chronic Obstructive Pulmonary Disease (COPD)'),

            // Recommended Steps
            _sectionTitle('Recommended Next Steps'),
            _sectionBody(
                'Consulting with a pulmonologist is advised for a thorough evaluation and personalized treatment strategies.'),

            // Buttons
            CustomAppButton(
              text: 'Share Results in Circle',
              onTap: () =>
                  Navigator.pushNamed(context, Routes.processingScreen),
            ),
            const SizedBox(height: 12),
            CustomAppButton(
              text: 'Upload Another Scan',
              bgColor: const Color(0xffEFF1F5),
              textColor: Colors.black,
              onTap: () =>
                  Navigator.pushNamed(context, Routes.processingScreen),
            ),
            const SizedBox(height: 30),

            // Help
            _sectionTitle('Need Help?'),
            _sectionBody('Visit our FAQ or contact support for assistance.'),
            const SizedBox(height: 8),
            CustomAppButton(
              text: 'Visit FAQ',
              bgColor: const Color(0xffEFF1F5),
              textColor: Colors.black,
              onTap: () => Navigator.pushNamed(context, Routes.profileFaqView),
            ),
            const SizedBox(height: 12),
            CustomAppButton(
              text: 'Contact Support',
              bgColor: const Color(0xffEFF1F5),
              textColor: Colors.black,
              onTap: () =>
                  Navigator.pushNamed(context, Routes.profilePrivacyCenterApp),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyles.font20SemiBold),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _sectionBody(String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(content, style: AppStyles.font16Regular),
        const SizedBox(height: 20),
      ],
    );
  }
}

class FeedBackReviewsWidget extends StatelessWidget {
  const FeedBackReviewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(onTap: () {}, child: const Icon(Icons.star_border)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('4.95', style: AppStyles.font16SemiBold),
        ),
        Text(
          '22 reviews',
          style:
              AppStyles.font16Regular.copyWith(color: const Color(0xffA09CAB)),
        ),
      ],
    );
  }
}
