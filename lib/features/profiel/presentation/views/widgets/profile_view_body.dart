import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_animtype.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:tamenny_app/core/functions/show_language_picker.dart';
import 'package:tamenny_app/core/routes/routes.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';
import 'package:tamenny_app/core/widgets/custom_app_button.dart';
import 'package:tamenny_app/features/profiel/presentation/views/widgets/profile_header.dart';
import 'package:tamenny_app/features/profiel/presentation/views/widgets/profile_item.dart';
import 'package:tamenny_app/features/profiel/presentation/views/widgets/profile_section.dart';
import 'package:tamenny_app/main.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const ProfileHeader(),
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
                  try {
                    await FirebaseAuth.instance.signOut();
                    await GoogleSignIn().signOut();

                    final accessToken = await FacebookAuth.instance.accessToken;
                    if (accessToken != null) {
                      await FacebookAuth.instance.logOut();
                    }

                    await Navigator.of(context, rootNavigator: true)
                        .pushNamedAndRemoveUntil(
                            Routes.loginView, (route) => false);
                  } catch (e) {
                    // Handle/log error
                    print('Sign-out error: $e');
                  }
                },
                cancelBtnText: 'Cancel',
              );
            },
            bgColor: Colors.white,
            textColor: Colors.red,
          )
        ],
      ),
    );
  }
}
