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
    final localeNotifier = Provider.of<LocaleNotifier>(context);

    return MaterialApp(
      locale: localeNotifier.locale,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.currentTheme,
      darkTheme: darkTheme,
      themeMode: themeNotifier.isDark ? ThemeMode.dark : ThemeMode.light,
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: Routes.splashView,
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
