import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      backgroundColor: AppColors.primaryColor,
      appBar: customAppBar(context,
          title: 'Profile',
          titleColor: Colors.white,
          leadingIcon: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamed(Routes.settingsView);
                  },
                  child: SvgPicture.asset(Assets.imagesSettingIcon)),
            ),
          ],
          backgroundColor: AppColors.primaryColor),
      body: Column(
        children: [
          Container(
            height: 150,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -60,
                    right: 0,
                    left: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 65,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(999),
                        child: Image.asset(
                          Assets.imagesProfiel,
                          height: 120,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        const Text(
                          'Muaz Osama',
                          style: AppStyles.font20SemiBold,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'muazosama@gmail.com',
                          style: AppStyles.font14Regular.copyWith(
                            color: const Color(0xff242424),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xfff8f8f8),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomLeft: Radius.circular(12),
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'No of Scans : 3',
                                    style: AppStyles.font12Regular,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xfff8f8f8),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Medical records',
                                    style: AppStyles.font12Regular,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        ProfileItem(
                          text: 'Personal Information',
                          image: Assets.imagesPersonalCardIcon,
                          backgroundColor: const Color(0xffEAF2FF),
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .pushNamed(Routes.personalInfoView);
                          },
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey[100],
                        ),
                        const ProfileItem(
                          text: 'My Test & Diagnostic',
                          image: Assets.imagesDirectIconBoxIcon,
                          backgroundColor: Color(0xffE9FAEF),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey[100],
                        ),
                        const ProfileItem(
                          text: 'Payment',
                          image: Assets.imagesPaymentIcon,
                          backgroundColor: Color(0xffFFEEEF),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
