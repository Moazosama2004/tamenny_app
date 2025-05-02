import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tamenny_app/core/functions/get_user_entity.dart';
import 'package:tamenny_app/core/routes/routes.dart';
import 'package:tamenny_app/core/theme/app_colors.dart';
import 'package:tamenny_app/core/theme/app_styles.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';
import 'package:tamenny_app/core/widgets/custom_app_bar.dart';
import 'package:tamenny_app/features/profiel/presentation/views/widgets/profile_item.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: 'Profile',
        leadingIcon: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  await GoogleSignIn().signOut();

                  Navigator.of(context, rootNavigator: true)
                      .pushNamed(Routes.loginView);
                },
                child: SvgPicture.asset(Assets.imagesProfileShareIcon)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: Column(
            children: [
              const SizedBox(height: 12.0),
              Row(
                children: [
                  CircleAvatar(
                    radius: 29,
                    backgroundImage:
                        NetworkImage(getUserEntitiy().userAvatarUrl),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    getUserEntitiy().name,
                    style: AppStyles.font18SemiBold,
                  ),
                ],
              ),
              const SizedBox(
                height: 18.0,
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('ACCOUNT'),
                    const SizedBox(
                      height: 18,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true)
                            .pushNamed(Routes.personalInfoView);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 24,
                                height: 24,
                                child: Center(
                                  child: SvgPicture.asset(
                                    Assets.imagesProfileDataIcon,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              const Text('Profile Data'),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: SvgPicture.asset(
                              Assets.imagesProfileArrowGoIcon,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Center(
                                child: SvgPicture.asset(
                                  Assets.imagesProfileNotificationIcon,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            const Text('Notification'),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: SvgPicture.asset(
                            Assets.imagesProfileArrowGoIcon,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Center(
                                child: SvgPicture.asset(
                                  Assets.imagesChangePasswordIcon,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            const Text('Change Password'),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: SvgPicture.asset(
                            Assets.imagesProfileArrowGoIcon,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Preference'),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.imagesDarkModeIcon,
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            const Text('Dark Mode'),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: SvgPicture.asset(
                            Assets.imagesProfileArrowGoIcon,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.imagesLanguageIcon,
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            const Text('Language'),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: SvgPicture.asset(
                            Assets.imagesProfileArrowGoIcon,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('HELP'),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.imagesQuestionIcon,
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            const Text('FAQ'),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: SvgPicture.asset(
                            Assets.imagesProfileArrowGoIcon,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.imagesPrivacyIcon,
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            const Text('Privacy Center'),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: SvgPicture.asset(
                            Assets.imagesProfileArrowGoIcon,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
