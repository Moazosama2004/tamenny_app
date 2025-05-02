import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamenny_app/core/services/get_it_service.dart';
import 'package:tamenny_app/core/theme/app_colors.dart';
import 'package:tamenny_app/features/auth/domain/repos/auth_repo.dart';
import 'package:tamenny_app/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:tamenny_app/features/auth/presentation/views/widgets/custom_clip_path_with_logo.dart';
import 'package:tamenny_app/features/auth/presentation/views/widgets/signin_view_body.dart';
import 'widgets/signin_form_section.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: AppColors.primaryColor,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: BlocProvider(
          create: (context) => SigninCubit(getIt.get<AuthRepo>()),
          child: const SigninViewBody(),
        ),
      ),
    );
  }
}
