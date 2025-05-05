import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamenny_app/core/functions/build_error_snack_bar.dart';
import 'package:tamenny_app/core/theme/app_colors.dart';
import 'package:tamenny_app/features/community/presentation/manager/post_cubit/post_cubit.dart';
import 'package:tamenny_app/features/community/presentation/manager/post_cubit/post_state.dart';

class AddPostButtonBlocConsumer extends StatelessWidget {
  const AddPostButtonBlocConsumer(
      {super.key, this.selectedImage, required this.postTextController});
  final TextEditingController postTextController;
  final File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPostCubit, AddPostState>(
      listener: (context, state) {
        if (state is AddPostSuccess) {
          showErrorBar(context, message: 'Posted successfully!');
          Navigator.pop(context);
        }

        if (state is AddPostFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        log('AddPostButtonBlocConsumer => ${postTextController.text}');
        return TextButton(
          onPressed: state is AddPostLoading
              ? null
              : () async {
                  log('AddPostButtonBlocConsumer => ${postTextController.text}');
                  await context.read<AddPostCubit>().postNow(
                        postText: postTextController.text,
                        selectedImage: selectedImage,
                      );
                },
          style: TextButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            minimumSize: const Size(92, 40),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: state is AddPostLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.white,
                ))
              : const Text("Post now", style: TextStyle(color: Colors.white)),
        );
      },
    );
  }
}
