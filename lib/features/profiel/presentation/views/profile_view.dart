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
      appBar: customAppBar(
        context,
        title: 'Profile',
        leadingIcon: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
                onTap: () {},
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
              const Row(
                children: [
                  CircleAvatar(
                    radius: 29,
                    backgroundImage: NetworkImage(
                        'https://scontent.fcai21-4.fna.fbcdn.net/v/t39.30808-6/480736065_1351844645997522_5916626625746172420_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=4wz_eaDqd4kQ7kNvwHrwSPJ&_nc_oc=AdlMaHRWgrRiJv_XJABvv7rEHhH0UVcQR8c6RL8BZ8Epk6K0Jc5YUhu2m0_0dTSQj_8&_nc_zt=23&_nc_ht=scontent.fcai21-4.fna&_nc_gid=jlliu27TIwyOdgkU69Aeng&oh=00_AfEfb4qpCdW9n9K4z3ZC1yAF9oy0b9RzV6jUM88U_07Xiw&oe=68075E87'), // Dynamic avatar URL
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    'Muaz Osama',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.imagesProfileDataIcon,
                              width: 24,
                              height: 24,
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
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.imagesProfileNotificationIcon,
                              width: 24,
                              height: 24,
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
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.imagesChangePasswordIcon,
                              width: 24,
                              height: 24,
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
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
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
                      height: 12,
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
                height: 12,
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
                      height: 12,
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
