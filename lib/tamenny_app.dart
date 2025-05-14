import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:provider/provider.dart';
import 'package:tamenny_app/config/cache_helper.dart';
import 'package:tamenny_app/core/routes/app_router.dart';
import 'package:tamenny_app/core/routes/routes.dart';
import 'package:tamenny_app/generated/l10n.dart';

import 'package:tamenny_app/main.dart';

class TamennyApp extends StatelessWidget {
  const TamennyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final locale = Provider.of<LocaleNotifier>(context).locale;
    return MaterialApp(
      // locale: locale,
      // locale: const Locale('ar'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'SA'),
      ],
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: Routes.splashView,
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.currentTheme,
    );
  }
}

class LocaleNotifier extends ChangeNotifier {
  static const String _localeKey = 'selectedLocale';
  Locale _locale = const Locale('en'); // Default language is English

  Locale get locale => _locale;

  LocaleNotifier() {
    loadLocaleFromPrefs(); // Load saved locale on init
  }

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
    _saveLocaleToPrefs();
  }

  Future<void> loadLocaleFromPrefs() async {
    final String languageCode = CacheHelper.getString(key: _localeKey) ?? 'en';
    _locale = Locale(languageCode);
    notifyListeners();
  }

  Future<void> _saveLocaleToPrefs() async {
    await CacheHelper.set(key: _localeKey, value: _locale.languageCode);
  }
}
