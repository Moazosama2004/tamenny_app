import 'package:flutter/material.dart';

import 'package:tamenny_app/core/widgets/custom_app_bar.dart';
import 'package:tamenny_app/features/community/presentation/views/widgets/post.dart';



class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Community',leadingIcon: false),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
            itemCount: 5,
            itemBuilder: (context, index) => const Post()),
      ),
    );
  }
}

