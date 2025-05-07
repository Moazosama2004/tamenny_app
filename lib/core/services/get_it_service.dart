import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:tamenny_app/core/cubits/user_cubit/user_cubit.dart';
import 'package:tamenny_app/core/services/Medical_news_api_service.dart';
import 'package:tamenny_app/core/services/database_service.dart';
import 'package:tamenny_app/core/services/firebase_auth_service.dart';
import 'package:tamenny_app/core/services/firestore_service.dart';
import 'package:tamenny_app/core/services/storage_service.dart';
import 'package:tamenny_app/core/services/supabase_storage_service.dart';
import 'package:tamenny_app/features/auth/data/models/user_model.dart';
import 'package:tamenny_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:tamenny_app/features/auth/domain/repos/auth_repo.dart';
import 'package:tamenny_app/features/community/data/repos/community_repo_impl.dart';
import 'package:tamenny_app/features/community/domain/repos/community_repo.dart';
import 'package:tamenny_app/features/home/data/repos/medical_news_repo_impl.dart';
import 'package:tamenny_app/features/home/domain/repos/medical_news_repo.dart';

final getIt = GetIt.instance;

void setupGetIt() async {
  final userBox = await Hive.openBox<UserModel>('user');
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  getIt.registerSingleton<StorageService>(SupabaseStorageService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );

  getIt.registerSingleton<MedicalNewsApiService>(MedicalNewsApiService(Dio()));

  getIt.registerSingleton<MedicalNewsRepo>(
    MedicalNewsRepoImpl(
      getIt<MedicalNewsApiService>(),
    ),
  );
  getIt.registerSingleton<CommunityRepo>(
    CommunityRepoImpl(
      getIt<DatabaseService>(),
    ),
  );

  getIt.registerLazySingleton(() => userBox);
  getIt.registerLazySingleton(() => UserCubit(getIt<Box<UserModel>>()));
}
