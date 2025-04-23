import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamenny_app/core/functions/build_error_snack_bar.dart';
import 'package:tamenny_app/core/routes/routes.dart';
import 'package:tamenny_app/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:tamenny_app/features/auth/presentation/views/widgets/remember_me_and_forgot_password.dart';

import '../../../../../core/functions/show_toast_message.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/widgets/custom_app_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/dont_have_an_account.dart';
import '../functions/login_navigation_with_toast_message.dart';
import 'or_sign_in_with.dart';
import 'social_media_methods.dart';
import 'terms_and_conditions.dart';

class SigninFormSection extends StatefulWidget {
  const SigninFormSection({super.key});

  @override
  State<SigninFormSection> createState() => _SigninFormSectionState();
}

class _SigninFormSectionState extends State<SigninFormSection> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          showErrorBar(context, message: 'تم تسجيل الدخول بنجاح');
          Navigator.pushReplacementNamed(context, Routes.bottomNavBarView);
        } else if (state is SignInFailure) {
          showErrorBar(context, message: state.errMessage);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 14,
                ),
                Text(
                  'Welcome Back',
                  style: AppStyles.font24Bold
                      .copyWith(color: AppColors.primaryColor),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  hintText: 'Email',
                  onSaved: (data) {
                    email = data!;
                  },
                  validate: (value) {
                    final emailRegex = RegExp(
                        r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
                    if (value == null || value.isEmpty) {
                      return 'Email is required.';
                    }
                    if (!emailRegex.hasMatch(value)) {
                      return 'Enter a valid email address.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  hintText: 'Password',
                  onSaved: (data) {
                    password = data!;
                  },
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required.';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters long.';
                    }
                    final passwordRegex = RegExp(
                        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$');
                    if (!passwordRegex.hasMatch(value)) {
                      return 'Password must include uppercase, lowercase, number, and special character.';
                    }
                    return null;
                  },
                  obscure: false,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.remove_red_eye),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const RememberMeWidgetAndForgotPassword(),
                const SizedBox(
                  height: 32,
                ),
                state is SignInSuccess
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : CustomAppButton(
                        text: 'Login',
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            context
                                .read<SigninCubit>()
                                .signInWithEmailAndPassword(
                                    email: email, password: password);
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                      ),
                const SizedBox(
                  height: 46,
                ),
                const OrSignInWith(),
                const SizedBox(
                  height: 32,
                ),
                const SocialMediaMethods(),
                const SizedBox(
                  height: 32,
                ),
                const TermsAndConditionsAndPrivacyPolicy(),
                const SizedBox(
                  height: 24,
                ),
                const DontHaveAnAccount(),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
