import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tamenny_app/config/cache_helper.dart';

import '../../../../../core/routes/routes.dart';

Future<Null> customNavigationFromSplashToAnotherViews(
    BuildContext context, bool? isOnboardingVisited) {
  return Future.delayed(
    const Duration(milliseconds: 5000),
    () {
      if (isOnboardingVisited == true) {
        FirebaseAuth.instance.currentUser == null
            ? Navigator.pushReplacementNamed(context, Routes.loginView)
            : Navigator.pushReplacementNamed(context, Routes.bottomNavBarView);
      } else {
        CacheHelper.set(key: 'isOnboardingVisited', value: true);
        Navigator.pushReplacementNamed(context, Routes.welcomeView);
      }
    },
  );
}
