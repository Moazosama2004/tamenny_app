import 'package:flutter/material.dart';
import 'package:tamenny_app/features/profiel/domain/entites/faq_item_entity.dart';
import 'package:tamenny_app/features/profiel/presentation/views/widgets/expanded_list_widget.dart';
import 'package:tamenny_app/features/profiel/presentation/views/widgets/profile_faq_view_body.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class ProfileFaqView extends StatelessWidget {
  const ProfileFaqView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'FAQ'),
      body: ProfileFaqViewBody(),
    );
  }
}
