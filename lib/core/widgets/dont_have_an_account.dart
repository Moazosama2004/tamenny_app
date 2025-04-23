import 'package:flutter/material.dart';

import '../routes/routes.dart';
import '../theme/app_colors.dart';
import '../theme/app_styles.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don’t have an account?',
          style: AppStyles.font11Regular,
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.signupView);
          },
          child: Text(
            'Sign Up.',
            style: AppStyles.font11Regular.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
