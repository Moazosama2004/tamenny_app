import 'package:flutter/material.dart';
import 'package:tamenny_app/core/widgets/custom_app_bar.dart';
import 'package:tamenny_app/features/community/data/models/post_model.dart';
import 'package:tamenny_app/features/community/domain/entites/post_entity.dart';
import 'package:tamenny_app/features/community/presentation/views/widgets/comment_widget.dart';
import 'package:tamenny_app/features/community/presentation/views/widgets/post.dart';

class PostDetailsView extends StatelessWidget {
  final PostEntity post;

  const PostDetailsView({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    // TODO: Replace this with real comments from Firestore or your backend
    final dummyComments = List.generate(
      5,
      (index) => {
        'username': 'user$index',
        'comment': 'This is comment number $index',
      },
    );

    return Scaffold(
      appBar: customAppBar(context, title: ''),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          Post(post: post),
          const SizedBox(height: 24),
          const Text(
            'Comments',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...dummyComments.map((comment) => CommentWidget(
                username: comment['username']!,
                comment: comment['comment']!,
              )),
        ],
      ),
    );
  }
}
