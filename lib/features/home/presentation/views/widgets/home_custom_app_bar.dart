import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tamenny_app/features/auth/presentation/view_model/cubit/auth_cubit.dart';
import 'package:tamenny_app/features/auth/presentation/view_model/cubit/auth_state.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/utils/app_assets.dart';

class HomeCustomAppBar extends StatelessWidget {
  const HomeCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthCubit>().state;
    log(authState.toString());
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage(
          Assets.imagesProfiel,
        ),
      ),
      title: Text(
        getUserName(authState),
        style: AppStyles.font18Bold.copyWith(),
      ),
      subtitle: Text(
        'How are you Today?',
        style: AppStyles.font11Regular.copyWith(
          color: const Color(0xff616161),
        ),
      ),
      trailing: GestureDetector(
        onTap: () {
          Navigator.of(context, rootNavigator: true)
              .pushNamed(Routes.notificationView);
        },
        child: CircleAvatar(
          radius: 24,
          backgroundColor: const Color(0xffF5F5F5),
          child: SvgPicture.asset(Assets.imagesNotificationFoundIcon),
        ),
      ),
    );
  }
}

String getUserName(AuthState state) {
  if (state is LogInSuccessState || state is SignUpSuccessState) {
    return (state as dynamic).user.name;
  }
  return '';
}
