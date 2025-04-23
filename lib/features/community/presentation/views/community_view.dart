import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamenny_app/core/routes/routes.dart';
import 'package:tamenny_app/core/theme/app_colors.dart';
import 'package:tamenny_app/core/widgets/custom_app_bar.dart';
import 'package:tamenny_app/features/community/presentation/manager/community_cubit/community_cubit.dart';
import 'package:tamenny_app/features/community/presentation/manager/community_cubit/community_state.dart';
import 'package:tamenny_app/features/community/presentation/views/widgets/post.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Community', leadingIcon: false),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.of(context, rootNavigator: true)
              .pushNamed(Routes.addPostView);

          // لو رجع true يعني تم إضافة بوست
          if (result == true) {
            context.read<CommunityCubit>().getPosts(); // ✅ إعادة تحميل البوستات
          }
        },
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<CommunityCubit, CommunityState>(
        builder: (context, state) {
          if (state is CommunityLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CommunitySuccess) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: state.posts.length,
                itemBuilder: (context, index) => Post(post: state.posts[index]),
              ),
            );
          } else if (state is CommunityFailure) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
