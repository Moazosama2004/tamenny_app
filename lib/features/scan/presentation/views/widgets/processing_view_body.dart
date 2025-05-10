import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:tamenny_app/core/routes/routes.dart';
import 'package:tamenny_app/core/theme/app_colors.dart';
import 'package:tamenny_app/core/theme/app_styles.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';
import 'package:tamenny_app/core/widgets/custom_app_button.dart';

class ProcessingViewBody extends StatelessWidget {
  const ProcessingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        children: [
          Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Processing',
                textAlign: TextAlign.center,
                style: AppStyles.font48SemiBold
                    .copyWith(color: AppColors.primaryColor),
              ),
            ),
          ),
          SizedBox(
              height: 350,
              width: 250,
              child: Image.asset(Assets.imagesAiProcessingModel)),
          const SizedBox(
            height: 76,
          ),
          LinearPercentIndicator(
            progressColor: AppColors.primaryColor,
            percent: 0.8,
            animationDuration: 2500,
            animation: true,
            lineHeight: 10.0,
            barRadius: const Radius.circular(16),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'AI in action! Tamenny is analyzing your data to provide a personalized assessment. Sit tight!',
              textAlign: TextAlign.center,
              style: AppStyles.font16SemiBold
                  .copyWith(color: const Color(0xff242424)),
            ),
          ),
          const SizedBox(
            height: 53,
          ),
          CustomAppButton(
              text: 'Cancel',
              bgColor: Colors.red,
              onTap: () {
                Navigator.pushNamed(context, Routes.bottomNavBarView);
              })
        ],
      ),
    );
  }
}
