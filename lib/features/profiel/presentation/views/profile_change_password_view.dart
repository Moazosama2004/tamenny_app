import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamenny_app/core/services/firebase_auth_service.dart';
import 'package:tamenny_app/core/services/get_it_service.dart';
import 'package:tamenny_app/core/widgets/custom_app_bar.dart';
import 'package:tamenny_app/core/widgets/custom_error_widget.dart';
import 'package:tamenny_app/features/profiel/domain/repo/change_password_repo.dart';
import 'package:tamenny_app/features/profiel/presentation/manager/cubit/change_password_cubit.dart';
import 'package:tamenny_app/features/profiel/presentation/views/widgets/profile_change_password_view_body.dart';

class ProfileChangePasswordView extends StatelessWidget {
  const ProfileChangePasswordView({super.key});

  // bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(
        getIt<ChangePasswordRepo>(),
        getIt<FirebaseAuthService>(),
      ),
      child: Scaffold(
        appBar:
            customAppBar(context, title: 'Change Password', leadingIcon: true),
        body: const ProfileChangePasswordBlocConsumer(),
      ),
    );
  }
}

class ProfileChangePasswordBlocConsumer extends StatelessWidget {
  const ProfileChangePasswordBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is ChangePasswordLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ChangePasswordFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          // For both initial and success state, show the form
          return const ProfileChangePasswordViewBody();
        }
      },
    );
  }
}
