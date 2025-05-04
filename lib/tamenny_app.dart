import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:tamenny_app/core/routes/app_router.dart';
import 'package:tamenny_app/core/routes/routes.dart';

import 'package:tamenny_app/main.dart';

class TamennyApp extends StatelessWidget {
  const TamennyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: Routes.splashView,
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.currentTheme,
    );
  }
}
