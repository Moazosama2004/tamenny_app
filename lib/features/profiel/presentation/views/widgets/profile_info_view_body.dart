import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tamenny_app/core/cubits/user_cubit/user_cubit.dart';
import 'package:tamenny_app/core/functions/build_error_snack_bar.dart';
import 'package:tamenny_app/core/functions/get_user_entity.dart';
import 'package:tamenny_app/core/services/get_it_service.dart';
import 'package:tamenny_app/core/theme/app_colors.dart';
import 'package:tamenny_app/core/theme/app_styles.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';
import 'package:tamenny_app/core/widgets/custom_app_button.dart';
import 'package:tamenny_app/features/profiel/presentation/manager/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:tamenny_app/features/profiel/presentation/manager/edit_profile_cubit/edit_profile_state.dart';

class ProfileInfoViewBody extends StatefulWidget {
  const ProfileInfoViewBody({
    super.key,
  });

  @override
  State<ProfileInfoViewBody> createState() => _ProfileInfoViewBodyState();
}

class _ProfileInfoViewBodyState extends State<ProfileInfoViewBody> {
  XFile? selectedImage;
  final ImagePicker _picker = ImagePicker();
  Future<void> pickImage() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        selectedImage = XFile(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileSuccess) {
          showErrorBar(context, message: 'profile picture updated');
          updateUserImageUrl(state.imageUrl);
        } else if (state is EditProfileCancelled) {
          showErrorBar(context, message: 'cancelled');
        } else if (state is EditProfileError) {
          log(state.message);
          showErrorBar(context, message: state.message);
        }
      },
      builder: (context, state) {
        return Padding(
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
                          GestureDetector(
                            onTap: () {
                              pickImage();
                            },
                            child: Skeletonizer(
                              enabled: state is EditProfileLoading,
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 65,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(999),
                                      child: selectedImage == null
                                          ? Image.network(
                                              getIt<UserCubit>()
                                                  .currentUser!
                                                  .userAvatarUrl,
                                              height: 120,
                                              width: 120,
                                              fit: BoxFit.cover,
                                            )
                                          : (Image.file(
                                              File(selectedImage!.path),
                                              height: 120,
                                              width: 120,
                                              fit: BoxFit.cover,
                                            )),
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
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: getIt<UserCubit>().currentUser!.name,
                          hintStyle: AppStyles.font14Medium.copyWith(
                            color: const Color(0xffC2C2C2),
                          ),
                          fillColor: AppColors.grayColor,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                                color: AppColors.deepGrayColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                                color: AppColors.deepGrayColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                                color: AppColors.deepGrayColor),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: getIt<UserCubit>().currentUser!.email,
                          hintStyle: AppStyles.font14Medium.copyWith(
                            color: const Color(0xffC2C2C2),
                          ),
                          fillColor: AppColors.grayColor,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                                color: AppColors.deepGrayColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                                color: AppColors.deepGrayColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                                color: AppColors.deepGrayColor),
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
                            borderSide: const BorderSide(
                                color: AppColors.deepGrayColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                                color: AppColors.deepGrayColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                                color: AppColors.deepGrayColor),
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
                  child: CustomAppButton(
                      text: 'Save',
                      onTap: () {
                        if (selectedImage != null) {
                          context.read<EditProfileCubit>().editProfileAvatar(
                                getIt<UserCubit>().currentUser!.uId,
                                selectedImage!,
                              );
                        } else {
                          showErrorBar(context,
                              message: 'Please choose a new avatar first');
                        }
                      }),
                ),
              ],
            ));
      },
    );
  }
}
