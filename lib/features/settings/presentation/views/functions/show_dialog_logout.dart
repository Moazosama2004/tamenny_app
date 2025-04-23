import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../../core/routes/routes.dart';

showAwesomeDialogLogout(BuildContext context) {
  AwesomeDialog(
    context: context,
    dialogBackgroundColor: Colors.white,
    dialogType: DialogType.error,
    // headerAnimationLoop: false,
    // btnOkColor: AppColors.primaryColor,
    // animType: AnimType.,
    title: 'Logout',
    desc:
        'You’ll need to enter your username and password next time  you want to login',
    btnCancelOnPress: () {},
    btnOkOnPress: () async {
      await FirebaseAuth.instance.signOut();
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.loginView,
        (route) => false,
      );
    },
  ).show();
}
