import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/routes/routes.dart';

import '../../../../core/theme/app_styles.dart';
import '../../../../core/utils/app_assets.dart';

import '../../../../core/widgets/custom_app_button.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff094E6C),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: [
              Image.asset(Assets.imagesDoctorCompletedModel),
              const SizedBox(
                height: 57,
              ),
              Text(
                'Completed',
                textAlign: TextAlign.center,
                style: AppStyles.font48SemiBold.copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Text(
                  'Good health starts with awareness. Thanks for letting Tamenny help you take that step!',
                  textAlign: TextAlign.center,
                  style: AppStyles.font16Medium.copyWith(color: Colors.white60),
                ),
              ),
              const SizedBox(
                height: 108,
              ),
              CustomAppButton(
                text: 'Show Results',
                bgColor: const Color(0xffD3A9FF).withOpacity(0.25),
                onTap: () {
                  Navigator.pushNamed(context, Routes.scanAnalysisResultsScreen);
                },
              ),
              const  SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// var mySystemTheme =
//     SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: Colors.red);
