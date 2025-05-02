import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamenny_app/bloc_observer.dart';
import 'package:tamenny_app/config/cache_helper.dart';
import 'package:tamenny_app/core/routes/app_router.dart';
import 'package:tamenny_app/core/services/get_it_service.dart';
import 'package:tamenny_app/core/services/supabase_storage_service.dart';
import 'package:tamenny_app/tamenny_app.dart';
import 'core/functions/change_system_ui_overlay_style.dart';
import 'core/functions/check_auth_state_changes.dart';
import 'firebase_options.dart';

void main() async {
  changeSystemUiOverlayStyle();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SupabaseStorageService.initSupaBase();
  checkAuthStateChanges();
  setupGetIt();
  await CacheHelper.init();
  Bloc.observer = SimpleBlocObserver();
  runApp(
    TamennyApp(
      appRouter: AppRouter(),
    ),
  );
}
