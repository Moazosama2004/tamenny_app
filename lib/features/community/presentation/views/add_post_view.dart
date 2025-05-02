import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tamenny_app/core/theme/app_colors.dart';
import 'package:tamenny_app/features/community/presentation/manager/community_cubit/community_cubit.dart';
import 'package:tamenny_app/features/community/presentation/manager/post_cubit/post_cubit.dart';
import 'package:tamenny_app/features/community/presentation/manager/post_cubit/post_state.dart'; // استيراد الكيوبت

class CreatePostView extends StatefulWidget {
  const CreatePostView({super.key});

  @override
  State<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
  final TextEditingController postController = TextEditingController();
  String privacy = 'Public';
  File? selectedImage;

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        selectedImage = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                  color: const Color(0xffF5F5F5),
                  borderRadius: BorderRadius.circular(100)),
              child: DropdownButton<String>(
                isDense: true,
                value: privacy,
                underline: const SizedBox(),
                items: const [
                  DropdownMenuItem(value: 'Public', child: Text('Public')),
                  DropdownMenuItem(value: 'Friends', child: Text('Friends')),
                  DropdownMenuItem(value: 'Only Me', child: Text('Only Me')),
                ],
                onChanged: (value) => setState(() => privacy = value!),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0),
        child: Column(
          children: [
            TextField(
              controller: postController,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: "What's on your mind?",
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 10),
            if (selectedImage != null)
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(selectedImage!,
                        height: 200, width: double.infinity, fit: BoxFit.cover),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () => setState(() => selectedImage = null),
                      child: const CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.black54,
                        child: Icon(Icons.close, color: Colors.white, size: 16),
                      ),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        icon: const Icon(Icons.image, color: Colors.blue),
                        onPressed: pickImage),
                    IconButton(
                        icon: const Icon(Icons.gif_box_outlined,
                            color: Colors.blue),
                        onPressed: () {}),
                    IconButton(
                        icon: const Icon(Icons.location_on, color: Colors.blue),
                        onPressed: () {}),
                  ],
                ),
                BlocConsumer<PostCubit, PostState>(
                  listener: (context, state) {
                    if (state is PostSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Posted successfully!")),
                      );

                      Navigator.pop(
                          context, true); // ✅ نرجع true عشان نستخدمه لما نرجع
                    }

                    if (state is PostFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.error)),
                      );
                    }
                  },
                  builder: (context, state) {
                    return TextButton(
                      onPressed: state is PostLoading
                          ? null
                          : () async {
                              await context.read<PostCubit>().postNow(
                                    postText: postController.text,
                                    privacy: privacy,
                                    selectedImage: selectedImage,
                                  );
                              // ❌ متعملش pop هنا، خليه جوه listener لما تكون العملية نجحت
                            },
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        minimumSize: const Size(92, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: state is PostLoading
                          ? const CircularProgressIndicator()
                          : const Text("Post now",
                              style: TextStyle(color: Colors.white)),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
