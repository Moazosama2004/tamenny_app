
import 'package:flutter/material.dart';
import 'package:tamenny_app/core/widgets/custom_app_switch.dart';
import 'package:tamenny_app/features/settings/presentation/views/widgets/settings_item.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class SettingsNotificationView extends StatelessWidget {
  const SettingsNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Notification'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(children: [
          SettingsItem(
            // leadingIcon: SvgPicture.asset(Assets.imagesNotificationIcon),
            title: 'Notification from Tamenny',
            onTap: () {},
            trailingIcon: const CustomAppSwitch(),
          ),
          SettingsItem(
            // leadingIcon: SvgPicture.asset(Assets.imagesNotificationIcon),
            title: 'Sound',
            onTap: () {},
            trailingIcon: const CustomAppSwitch(),
          ),
          SettingsItem(
            // leadingIcon: SvgPicture.asset(Assets.imagesNotificationIcon),
            title: 'Vibrate',
            onTap: () {},
            trailingIcon: const CustomAppSwitch(),
          ),
          SettingsItem(
            // leadingIcon: SvgPicture.asset(Assets.imagesNotificationIcon),
            title: 'App Updates',
            onTap: () {},
            trailingIcon: const CustomAppSwitch(),
          ),
        ]),
      ),
    );
  }
}
