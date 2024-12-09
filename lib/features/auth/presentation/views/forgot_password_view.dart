import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/login_custom_clipper.dart';
import '../../../../core/widgets/custom_app_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../view_model/cubit/auth_cubit.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ClipPath(
              clipper: CustomLogoClipper(),
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.15,
                width: double.infinity,
                color: AppColors.primaryColor,
                child: Center(
                  child: SvgPicture.asset(
                    Assets.imagesLogoWhite,
                  ),
                ),
              ),
            ),
            Expanded(child: const ForgotPasswordBodyWithOutClipper()),
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordBodyWithOutClipper extends StatelessWidget {
  const ForgotPasswordBodyWithOutClipper({super.key});

  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 14,
          ),
          Text(
            'Forgot Password',
            style: AppStyles.font24Bold.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'At our app, we take the security of your information seriously.',
            style: AppStyles.font14Regular.copyWith(
              color: Color(0xff757575),
              letterSpacing: 1,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          CustomTextFormField(
            hintText: 'Email or Phone Number',
            validate: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter your Email';
              }
              return null;
            },
            onChanged: (data) {
              authCubit.email = data;
            },
          ),
          Expanded(
            child: const SizedBox(),
          ),
          CustomAppButton(
            text: 'Reset Password',
            onTap: () {
              authCubit.resetPassword();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content:
                      Text('Check Mail'),
                ),
              );
            },
          ),
          SizedBox(
            height: 26,
          ),
        ],
      ),
    );
  }
}
