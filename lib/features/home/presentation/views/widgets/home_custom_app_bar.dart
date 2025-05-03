import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tamenny_app/core/functions/get_user_entity.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/utils/app_assets.dart';

class HomeCustomAppBar extends StatelessWidget {
  const HomeCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // final authState = context.watch<AuthCubit>().state;
    // log(authState.toString());
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: NetworkImage(getUserEntitiy().userAvatarUrl),
      ),
      title: Text(
        'Hi ${getUserEntitiy().name}',
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
