import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamenny_app/bloc_observer.dart';
import 'package:tamenny_app/core/routes/app_router.dart';
import 'package:tamenny_app/tamenny_app.dart';
import 'core/databases/cache_helper.dart';
import 'core/di/service_locator.dart';
import 'core/functions/change_system_ui_overlay_style.dart';
import 'core/functions/check_auth_state_changes.dart';
import 'firebase_options.dart';

void main() async {
  changeSystemUiOverlayStyle();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  checkAuthStateChanges();
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  Bloc.observer = AppBlocObserver();
  runApp(
    TamennyApp(
      appRouter: AppRouter(),
    ),
  );
}
