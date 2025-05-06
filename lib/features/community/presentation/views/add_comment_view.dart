import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tamenny_app/core/theme/app_colors.dart';
import 'package:tamenny_app/core/widgets/custom_app_bar.dart';
import 'package:tamenny_app/features/community/data/models/post_model.dart';
import 'package:tamenny_app/features/community/domain/entites/post_entity.dart';

class AddCommentView extends StatefulWidget {
  final PostEntity post;

  const AddCommentView({super.key, required this.post});

  @override
  State<AddCommentView> createState() => _AddCommentViewState();
}

class _AddCommentViewState extends State<AddCommentView> {
  final TextEditingController _controller = TextEditingController();
  bool isSending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayColor,
      appBar: customAppBar(context, title: ''),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            /// POST PREVIEW
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(widget.post.userAvatarUrl),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.deepGrayColor,
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Text(
                      widget.post.postText,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: 20),

            /// TEXT FIELD
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?img=12'), // Replace with user
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    maxLines: null,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                      hintText: "Post your reply...",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
