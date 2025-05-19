import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quickalert/models/quickalert_animtype.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:tamenny_app/core/routes/routes.dart';
import 'package:tamenny_app/core/widgets/custom_app_button.dart';
import 'package:tamenny_app/generated/l10n.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomAppButton(
      text: S.of(context).signOut,
      onTap: () async {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: S.of(context).confirmSignOut,
          text: S.of(context).signOutPrompt,
          animType: QuickAlertAnimType.scale,
          titleAlignment: TextAlign.center,
          confirmBtnColor: theme.colorScheme.error,
          confirmBtnText: S.of(context).signOut,
          confirmBtnTextStyle: TextStyle(color: theme.colorScheme.onError),
          barrierColor: Colors.black.withOpacity(0.4),
          backgroundColor: theme.colorScheme.surface,
          showCancelBtn: true,
          cancelBtnText: S.of(context).cancel,
          onConfirmBtnTap: () async {
            Navigator.of(context, rootNavigator: true).pop(); // Close alert
            try {
              await FirebaseAuth.instance.signOut();
              await GoogleSignIn().signOut();

              final accessToken = await FacebookAuth.instance.accessToken;
              if (accessToken != null) {
                await FacebookAuth.instance.logOut();
              }

              Navigator.of(context, rootNavigator: true)
                  .pushNamedAndRemoveUntil(Routes.loginView, (route) => false);
            } catch (e) {
              QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                title: S.of(context).error,
                text: S.of(context).signOutFailed,
                confirmBtnText: S.of(context).ok,
                confirmBtnColor: theme.colorScheme.primary,
              );
              print('Sign-out error: $e');
            }
          },
        );
      },
      // Use theme colors for button background and text
      bgColor: theme.colorScheme.surface,
      textColor: theme.colorScheme.error,
    );
  }
}
