import 'package:flutter/material.dart';

import 'package:tamenny_app/core/theme/app_colors.dart';

import '../../../../core/theme/app_styles.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/notification_item.dart';
import 'widgets/notification_state.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Notification', actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(24)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.5, vertical: 7),
              child: Text(
                '2 NEW',
                style: AppStyles.font8Medium.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: const [
            SizedBox(
              height: 32,
            ),
            NotificationState(),
            SizedBox(
              height: 32,
            ),
            NotificationItem(),
            SizedBox(
              height: 24,
            ),
            NotificationItem(),
            SizedBox(
              height: 24,
            ),
            NotificationItem(),
            SizedBox(
              height: 24,
            ),
            NotificationItem(),
          ],
        ),
      ),
    );
  }
}
