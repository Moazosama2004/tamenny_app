import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tamenny_app/core/widgets/custom_app_bar.dart';
import 'package:tamenny_app/core/widgets/custom_app_button.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/utils/app_assets.dart';

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Personal information'),
      body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 48,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
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
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: const Color(0xffF4F8FF),
                                  borderRadius: BorderRadius.circular(99),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: SvgPicture.asset(
                                  Assets.imagesPenEditIcon,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Muaz Osama',
                        hintStyle: AppStyles.font14Medium.copyWith(
                          color: const Color(0xffC2C2C2),
                        ),
                        fillColor: AppColors.grayColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                              const BorderSide(color: AppColors.deepGrayColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                              const BorderSide(color: AppColors.deepGrayColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                              const BorderSide(color: AppColors.deepGrayColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'omarahmed14@gmail.com',
                        hintStyle: AppStyles.font14Medium.copyWith(
                          color: const Color(0xffC2C2C2),
                        ),
                        fillColor: AppColors.grayColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                              const BorderSide(color: AppColors.deepGrayColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                              const BorderSide(color: AppColors.deepGrayColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                              const BorderSide(color: AppColors.deepGrayColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: AppStyles.font14Medium.copyWith(
                          color: const Color(0xffC2C2C2),
                        ),
                        fillColor: AppColors.grayColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                              const BorderSide(color: AppColors.deepGrayColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                              const BorderSide(color: AppColors.deepGrayColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                              const BorderSide(color: AppColors.deepGrayColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'When you set up your personal information settings, you should take care to provide accurate information.',
                      style: AppStyles.font12Regular
                          .copyWith(color: const Color(0xff757575)),
                    ),
                    const SizedBox(
                      height: 54,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                child: CustomAppButton(text: 'Save', onTap: () {}),
              ),
            ],
          )),
    );
  }
}
