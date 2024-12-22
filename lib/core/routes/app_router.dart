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
import '../../features/chatbot/presentation/views/chat_bot_view.dart';
import '../../features/home/presentation/views/health_scan_categories_view.dart';
import '../../features/home/presentation/views/notification_view.dart';
import '../../features/scan/presentation/views/preview_scan_view.dart';
import '../../features/settings/presentation/views/settings_faq_view.dart';
import '../../features/settings/presentation/views/settings_language_view.dart';
import '../../features/settings/presentation/views/settings_notification_view.dart';
import '../../features/settings/presentation/views/settings_security_view.dart';
import '../../features/settings/presentation/views/settings_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../../features/scan/presentation/views/completed_screen.dart';
import '../../features/scan/presentation/views/processing_screen.dart';
import '../../features/scan/presentation/views/scan_analysis_results.dart';
import '../../features/scan/presentation/views/scan_view.dart';
import '../../features/scan/presentation/views/upload_file_view.dart';

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
      case Routes.scanView:
        return MaterialPageRoute(
          builder: (context) => const ScanView(),
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
            child: const SignUpView(),
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
      case Routes.processingScreen:
        return MaterialPageRoute(
          builder: (context) => const ProcessingScreen(),
        );
      case Routes.uploadFileView:
        return MaterialPageRoute(
          builder: (context) => const UploadFileView(),
        );
      case Routes.healthScanCategoriesView:
        return MaterialPageRoute(
          builder: (context) => const HealthScanCategoriesView(),
        );
      case Routes.notificationView:
        return MaterialPageRoute(
          builder: (context) => const NotificationView(),
        );
      case Routes.completedScreen:
        return MaterialPageRoute(
          builder: (context) => const CompletedScreen(),
        );
      case Routes.scanAnalysisResultsScreen:
        return MaterialPageRoute(
          builder: (context) => const ScanAnalysisResults(),
        );
      case Routes.settingsView:
        return MaterialPageRoute(
          builder: (context) => const SettingsView(),
        );
      case Routes.settingsSecurityView:
        return MaterialPageRoute(
          builder: (context) => const SettingsSecurityView(),
        );
      case Routes.settingsNotificationView:
        return MaterialPageRoute(
          builder: (context) => const SettingsNotificationView(),
        );
      case Routes.settingsLanguageView:
        return MaterialPageRoute(
          builder: (context) => const SettingsLanguageView(),
        );
      case Routes.chatBotView:
        return MaterialPageRoute(
          builder: (context) => const ChatBotView(),
        );
      case Routes.settingsFaqView:
        return MaterialPageRoute(
          builder: (context) => const SettingsFaqView(),
        );
      case Routes.previewScanView:
        return MaterialPageRoute(
          builder: (context) => const PreviewScanView(),
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
