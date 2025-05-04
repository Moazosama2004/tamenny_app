import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tamenny_app/core/routes/routes.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';
import 'package:tamenny_app/core/widgets/custom_app_bar.dart';
import 'package:tamenny_app/features/settings/presentation/views/widgets/settings_item.dart';
import 'functions/show_dialog_logout.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Settings'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          children: [
            SettingsItem(
              leadingIcon: SvgPicture.asset(Assets.imagesNotificationIcon),
              title: 'Notification',
              onTap: () {
                Navigator.pushNamed(context, Routes.profileNotificationView);
              },
            ),
            SettingsItem(
              leadingIcon: SvgPicture.asset(Assets.imagesFaqIcon),
              title: 'FAQ',
              onTap: () {
                Navigator.pushNamed(context, Routes.settingsFaqView);
              },
            ),
            SettingsItem(
              leadingIcon: SvgPicture.asset(Assets.imagesSecurityIcon),
              title: 'Security',
              onTap: () {
                Navigator.pushNamed(context, Routes.settingsSecurityView);
              },
            ),
            SettingsItem(
              leadingIcon: SvgPicture.asset(Assets.imagesLanguageIcon),
              title: 'Language',
              onTap: () {
                Navigator.pushNamed(context, Routes.settingsLanguageView);
              },
            ),
            SettingsItem(
              leadingIcon: SvgPicture.asset(Assets.imagesLogoutIcon),
              title: 'Logout',
              titleColor: const Color(0xffFF4C5E),
              onTap: () async {
                showAwesomeDialogLogout(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
