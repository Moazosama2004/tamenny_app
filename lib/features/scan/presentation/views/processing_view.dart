import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tamenny_app/core/widgets/custom_app_button.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class ProcessingScreen extends StatefulWidget {
  const ProcessingScreen({super.key});

  @override
  State<ProcessingScreen> createState() => _ProcessingScreenState();
}

class _ProcessingScreenState extends State<ProcessingScreen> {
  bool isBack = false;
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 5000),
      () => Navigator.pushNamed(
        context,
        Routes.completedScreen,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: customAppBar(context, title: '', leadingIcon: false),
      appBar: customAppBar(context, title: 'Processing'),
      body: Padding(
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
      ),
    );
  }
}
