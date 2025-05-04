import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:tamenny_app/core/functions/get_user_entity.dart';
import 'package:tamenny_app/core/functions/show_language_picker.dart';
import 'package:tamenny_app/core/routes/routes.dart';
import 'package:tamenny_app/core/theme/app_colors.dart';
import 'package:tamenny_app/core/theme/app_styles.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';
import 'package:tamenny_app/core/widgets/custom_app_bar.dart';
import 'package:tamenny_app/core/widgets/custom_app_button.dart';
import 'package:tamenny_app/features/auth/domain/entites/user_entity.dart';
import 'package:tamenny_app/features/profiel/presentation/views/widgets/profile_header.dart';
import 'package:tamenny_app/features/profiel/presentation/views/widgets/profile_item.dart';
import 'package:tamenny_app/features/profiel/presentation/views/widgets/profile_section.dart';
import 'package:tamenny_app/main.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = getUserEntitiy();
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: customAppBar(
        context,
        title: 'Profile',
        leadingIcon: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset(Assets.imagesProfileShareIcon),
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
            ProfileSection(
              title: 'PREFERENCE',
              items: [
                ProfileItem(
                  iconPath: Assets.imagesDarkModeIcon,
                  title: 'Dark Mode',
                  trailingWidget: SizedBox(
                    width: 60,
                    height: 30,
                    child: Center(
                      child: FlutterSwitch(
                        value: themeNotifier.isDark,
                        onToggle: (val) {
                          themeNotifier.toggleTheme();
                        },
                        activeColor: Colors.black87,
                        inactiveColor: Colors.grey.shade300,
                        toggleColor: Colors.grey.shade100,
                        activeIcon:
                            const Icon(Icons.dark_mode, color: Colors.amber),
                        inactiveIcon:
                            const Icon(Icons.light_mode, color: Colors.black54),
                      ),
                    ),
                  ),
                ),
                ProfileItem(
                  iconPath: Assets.imagesLanguageIcon,
                  title: 'Language',
                  onTap: () {
                    showLanguagePicker(context, currentLanguage: 'en');
                  },
                ),
              ],
            ),

            // HELP
            ProfileSection(
              title: 'HELP',
              items: [
                ProfileItem(
                  iconPath: Assets.imagesQuestionIcon,
                  title: 'FAQ',
                  onTap: () => Navigator.of(context, rootNavigator: true)
                      .pushNamed(Routes.profileFaqView),
                ),
                ProfileItem(
                  iconPath: Assets.imagesPrivacyIcon,
                  title: 'Privacy Center',
                  onTap: () => Navigator.of(context, rootNavigator: true)
                      .pushNamed(Routes.profilePrivacyCenterApp),
                ),
              ],
            ),
            CustomAppButton(
              text: 'Sign out',
              onTap: () async {
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.warning,
                  text: 'Are you sure you want to log out?',
                  animType: QuickAlertAnimType.scale,
                  titleAlignment: TextAlign.center,
                  confirmBtnColor: Colors.white,
                  confirmBtnText: 'Sign out',
                  confirmBtnTextStyle: const TextStyle(
                    color: Colors.red,
                  ),
                  barrierColor: Colors.black.withAlpha(100),
                  backgroundColor: Colors.white,
                  showCancelBtn: true,
                  onConfirmBtnTap: () async {
                    await FirebaseAuth.instance.signOut();
                    await GoogleSignIn().signOut();
                    await FacebookAuth.instance.logOut();
                    await Navigator.of(context, rootNavigator: true)
                        .pushNamedAndRemoveUntil(
                      Routes.loginView,
                      (route) => false,
                    );
                  },
                  cancelBtnText: 'Cancel',
                );
              },
              bgColor: Colors.white,
              textColor: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
