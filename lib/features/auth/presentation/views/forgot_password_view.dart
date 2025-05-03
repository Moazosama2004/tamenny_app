import 'package:flutter/material.dart';
import 'package:tamenny_app/features/auth/presentation/views/widgets/custom_clip_path_with_logo.dart';
import 'widgets/forgot_password_form_section.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomClipPathWithLogo(),
            Expanded(child: ForgotPasswordFormSection()),
          ],
        ),
      ),
    );
  }
}
