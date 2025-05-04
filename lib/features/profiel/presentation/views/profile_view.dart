import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tamenny_app/core/functions/get_user_entity.dart';
import 'package:tamenny_app/core/routes/routes.dart';
import 'package:tamenny_app/core/theme/app_styles.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';
import 'package:tamenny_app/core/widgets/custom_app_bar.dart';
import 'package:tamenny_app/features/auth/domain/entites/user_entity.dart';
import 'package:tamenny_app/features/profiel/presentation/views/widgets/profile_header.dart';
import 'package:tamenny_app/features/profiel/presentation/views/widgets/profile_item.dart';
import 'package:tamenny_app/features/profiel/presentation/views/widgets/profile_section.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = getUserEntitiy();

    return Scaffold(
      appBar: customAppBar(
        context,
        title: 'Profile',
        leadingIcon: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                await GoogleSignIn().signOut();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.loginView,
                  (route) => false,
                );
              },
              child: SvgPicture.asset(Assets.imagesProfileShareIcon),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            ProfileHeader(user: user),
            const SizedBox(height: 24),

            // ACCOUNT
            ProfileSection(
              title: 'ACCOUNT',
              items: [
                ProfileItem(
                  iconPath: Assets.imagesProfileDataIcon,
                  title: 'Profile Data',
                  onTap: () => Navigator.of(context, rootNavigator: true)
                      .pushNamed(Routes.personalInfoView),
                ),
                ProfileItem(
                  iconPath: Assets.imagesProfileNotificationIcon,
                  title: 'Notification',
                  onTap: () => Navigator.of(context, rootNavigator: true)
                      .pushNamed(Routes.profileNotificationView),
                ),
                ProfileItem(
                  iconPath: Assets.imagesChangePasswordIcon,
                  title: 'Change Password',
                  onTap: () => Navigator.of(context, rootNavigator: true)
                      .pushNamed(Routes.profileChangePasswordView),
                ),
              ],
            ),

            // PREFERENCE
            const ProfileSection(
              title: 'PREFERENCE',
              items: [
                ProfileItem(
                  iconPath: Assets.imagesDarkModeIcon,
                  title: 'Dark Mode',
                ),
                ProfileItem(
                  iconPath: Assets.imagesLanguageIcon,
                  title: 'Language',
                ),
              ],
            ),

            // HELP
            const ProfileSection(
              title: 'HELP',
              items: [
                ProfileItem(
                  iconPath: Assets.imagesQuestionIcon,
                  title: 'FAQ',
                ),
                ProfileItem(
                  iconPath: Assets.imagesPrivacyIcon,
                  title: 'Privacy Center',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
