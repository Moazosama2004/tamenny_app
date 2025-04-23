import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamenny_app/features/auth/presentation/views/widgets/terms_and_conditions.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/widgets/already_have_an_account.dart';
import '../../../../../core/widgets/custom_app_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../view_model/cubit/auth_cubit.dart';
import '../../view_model/cubit/auth_state.dart';
import 'or_sign_in_with.dart';
import 'social_media_methods.dart';

class SignUpFormSection extends StatelessWidget {
  const SignUpFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  Text('Successifuly , check your email to verify account'),
            ),
          );
          Navigator.pushReplacementNamed(context, Routes.loginView);
        } else if (state is SignUpFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: authCubit.signupFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 14,
                ),
                Text(
                  'Create Account',
                  style: AppStyles.font24Bold.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  hintText: 'First Name',
                  onChanged: (data) {
                    authCubit.firstName = data;
                  },
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'First name is required.';
                    }
                    if (value.length < 2) {
                      return 'First name must be at least 2 characters long.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  hintText: 'Last Name',
                  onChanged: (data) {
                    authCubit.lasName = data;
                  },
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Last name is required.';
                    }
                    if (value.length < 2) {
                      return 'Last name must be at least 2 characters long.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  hintText: 'Email',
                  onChanged: (data) {
                    authCubit.email = data;
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
                  onChanged: (data) {
                    authCubit.password = data;
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
                  obscure: authCubit.obsecure,
                  suffixIcon: IconButton(
                    onPressed: () {
                      authCubit.changeObsecureState();
                    },
                    icon: Icon(
                      authCubit.obsecure == false
                          ? Icons.remove_red_eye
                          : Icons.visibility_off,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                state is SignUpLoadingState
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : CustomAppButton(
                        text: 'Create Account',
                        onTap: () {
                          if (authCubit.signupFormKey.currentState!
                              .validate()) {
                            authCubit.signUpWithEmailAndPassword();
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
                const AlreadyHaveAnAccount(),
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
