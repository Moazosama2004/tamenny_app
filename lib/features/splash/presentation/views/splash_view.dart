import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tamenny_app/config/cache_helper.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';
import 'functions/custom_navigation_from_splash_to_another_views.dart';
import 'widgets/logo_name_with_animation.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool? isOnboardingVisited =
        CacheHelper.getBool(key: 'isOnboardingVisited') ?? false;
    customNavigationFromSplashToAnotherViews(context, isOnboardingVisited);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 50,
              child: SvgPicture.asset(
                Assets.imagesLogo,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            const LogoNameWithAnimation(),
          ],
        ),
      ),
    );
  }
}
