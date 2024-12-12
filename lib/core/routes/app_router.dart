import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamenny_app/core/routes/routes.dart';
import 'package:tamenny_app/features/auth/presentation/view_model/cubit/auth_cubit.dart';
import 'package:tamenny_app/features/home/presentation/views/widgets/home_bottom_nav_bar.dart';
import 'package:tamenny_app/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:tamenny_app/features/onboarding/presentation/views/welcome_view.dart';

import '../../features/auth/presentation/views/forgot_password_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/home/presentation/views/health_scan_categories_view.dart';
import '../../features/home/presentation/views/notification_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case Routes.onboardingView:
        return MaterialPageRoute(
          builder: (context) => const OnboardingView(),
        );
      case Routes.welcomeView:
        return MaterialPageRoute(
          builder: (context) => const WelcomeView(),
        );
      case Routes.loginView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const LoginView(),
          ),
        );
      case Routes.signupView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const SignupView(),
          ),
        );
      case Routes.forgotPasswordView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const ForgotPasswordView(),
          ),
        );
      case Routes.bottomNavBarView:
        return MaterialPageRoute(
          builder: (context) => const BottomNavBar(),
        );
      case Routes.healthScanCategoriesView:
        return MaterialPageRoute(
          builder: (context) => const HealthScanCategoriesView(),
        );
      case Routes.notificationView:
        return MaterialPageRoute(
          builder: (context) => const NotificationView(),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No Route Defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
