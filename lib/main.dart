import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tamenny_app/bloc_observer.dart';
import 'package:tamenny_app/config/cache_helper.dart';
import 'package:tamenny_app/core/cubits/user_cubit/user_cubit.dart';
import 'package:tamenny_app/core/routes/app_router.dart';
import 'package:tamenny_app/core/services/get_it_service.dart';
import 'package:tamenny_app/core/services/supabase_storage_service.dart';
import 'package:tamenny_app/core/theme/app_colors.dart';
import 'package:tamenny_app/features/auth/data/models/user_model.dart';
import 'package:tamenny_app/features/map/domain/repos/nearby_doctors_repo.dart';
import 'package:tamenny_app/features/map/presentation/manager/nearby_doctors_cubit/nearby_doctors_cubit.dart';
import 'package:tamenny_app/tamenny_app.dart';
import 'core/functions/check_auth_state_changes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SupabaseStorageService.initSupaBase();
  checkAuthStateChanges();
  await CacheHelper.init();
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await setupGetIt();

  final themeNotifier = ThemeNotifier();
  final localeNotifier = LocaleNotifier();

  await themeNotifier.loadThemeFromPrefs();
  await localeNotifier.loadLocaleFromPrefs();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: themeNotifier,
        ),
        ChangeNotifierProvider.value(
          value: localeNotifier,
        ),
        BlocProvider(
          create: (context) => getIt<UserCubit>(),
        ),
        BlocProvider(
          create: (context) => NearbyDoctorsCubit(
            getIt<NearbyDoctorsRepo>(),
          )..fetchNearbyDoctors(),
        ),
      ],
      child: TamennyApp(
        appRouter: AppRouter(),
      ),
    ),
  );
}

class ThemeNotifier extends ChangeNotifier {
  static const String _themeKey = 'isDarkMode';
  bool _isDark = false;

  bool get isDark => _isDark;

  ThemeData get currentTheme =>
      _isDark ? darkTheme : ThemeData(scaffoldBackgroundColor: Colors.white);

  ThemeNotifier() {
    loadThemeFromPrefs(); // Load saved theme on init
  }

  void toggleTheme() async {
    _isDark = !_isDark;
    notifyListeners();
    _saveThemeToPrefs();
  }

  void setDarkMode(bool value) {
    _isDark = value;
    notifyListeners();
    _saveThemeToPrefs();
  }

  Future<void> loadThemeFromPrefs() async {
    _isDark = CacheHelper.getBool(key: _themeKey) ?? false;
    notifyListeners();
  }

  Future<void> _saveThemeToPrefs() async {
    await CacheHelper.set(key: _themeKey, value: _isDark);
  }
}

final ThemeData darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor:
      AppColors.darkBackgroundColor, // Dark screen background
  primaryColor: AppColors.darkPrimaryColor, // Primary accent in dark mode
  cardColor: AppColors.darkCardColor, // Background for cards and containers
  dividerColor: AppColors.darkDividerColor, // For lines/separators

  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.darkBackgroundColor, // App bar background
    foregroundColor: Colors.white, // App bar text/icon color
    iconTheme: IconThemeData(color: Colors.white), // App bar icons
  ),

  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.darkTextColor), // Main text
    bodyMedium:
        TextStyle(color: AppColors.darkSecondaryTextColor), // Secondary text
    titleLarge: TextStyle(color: AppColors.darkTextColor),
  ),

  iconTheme:
      const IconThemeData(color: AppColors.darkTextColor), // Default icon color

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.darkCardColor,
    selectedItemColor: AppColors.darkPrimaryColor,
    unselectedItemColor: AppColors.darkSecondaryTextColor,
  ),

  // Optional: Customize switches, sliders, etc.
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(AppColors.darkPrimaryColor),
    trackColor:
        WidgetStateProperty.all(AppColors.darkPrimaryColor.withOpacity(0.4)),
  ),
);
