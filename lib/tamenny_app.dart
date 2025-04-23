import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamenny_app/core/routes/app_router.dart';
import 'package:tamenny_app/core/routes/routes.dart';
import 'package:tamenny_app/core/theme/app_colors.dart';
import 'package:tamenny_app/features/auth/data/repos/auth_repo.dart';
import 'package:tamenny_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:tamenny_app/features/auth/presentation/view_model/cubit/auth_cubit.dart';

class TamennyApp extends StatelessWidget {
  const TamennyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(AuthRepoImpl()),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.splashView,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
