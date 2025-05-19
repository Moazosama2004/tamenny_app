import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tamenny_app/core/cubits/user_cubit/user_cubit.dart';
import 'package:tamenny_app/core/services/get_it_service.dart';
import 'package:tamenny_app/generated/l10n.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/utils/app_assets.dart';

class HomeCustomAppBar extends StatelessWidget {
  const HomeCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final avatarUrl =
        context.watch<UserCubit>().currentUser?.userAvatarUrl ?? '';

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.transparent,
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: avatarUrl,
            fit: BoxFit.cover,
            width: 40,
            height: 40,
            placeholder: (context, url) => Skeletonizer(
              enabled: true,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            errorWidget: (context, url, error) =>
                const Icon(Icons.person, size: 20),
          ),
        ),
      ),
      title: Text(
        '${S.of(context).hi} ${getIt<UserCubit>().currentUser!.name}',
        style: AppStyles.font18Bold.copyWith(),
      ),
      subtitle: Text(
        S.of(context).howAreYouToday,
        style: AppStyles.font11Regular.copyWith(
          color: const Color(0xff616161),
        ),
      ),
      trailing: GestureDetector(
        onTap: () {
          Navigator.of(context, rootNavigator: true)
              .pushNamed(Routes.notificationView);
        },
        child: const NotificationIconWidget(),
      ),
    );
  }
}

class NotificationIconWidget extends StatelessWidget {
  const NotificationIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return CircleAvatar(
      radius: 24,
      backgroundColor: isDark
          ? theme.cardColor.withOpacity(0.3) // subtle background in dark mode
          : const Color(0xffF5F5F5), // original light bg
      child: SvgPicture.asset(
        Assets.imagesNotificationFoundIcon,
        colorFilter: ColorFilter.mode(
          isDark ? Colors.white70 : Colors.black87,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
