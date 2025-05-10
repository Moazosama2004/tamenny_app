import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:tamenny_app/core/functions/get_user_entity.dart';
import 'package:tamenny_app/core/functions/show_language_picker.dart';
import 'package:tamenny_app/core/routes/routes.dart';
import 'package:tamenny_app/core/services/firestore_service.dart';
import 'package:tamenny_app/core/theme/app_colors.dart';
import 'package:tamenny_app/core/theme/app_styles.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';
import 'package:tamenny_app/core/widgets/custom_app_bar.dart';
import 'package:tamenny_app/core/widgets/custom_app_button.dart';
import 'package:tamenny_app/features/auth/domain/entites/user_entity.dart';
import 'package:tamenny_app/features/map/presentation/views/nearby_doctors_view.dart';
import 'package:tamenny_app/features/profiel/presentation/views/widgets/profile_header.dart';
import 'package:tamenny_app/features/profiel/presentation/views/widgets/profile_item.dart';
import 'package:tamenny_app/features/profiel/presentation/views/widgets/profile_section.dart';
import 'package:tamenny_app/features/profiel/presentation/views/widgets/profile_view_body.dart';
import 'package:tamenny_app/main.dart';

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
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
                onTap: () async {},
                child: SvgPicture.asset(Assets.imagesProfileShareIcon)),
          ),
        ],
      ),
      body: const ProfileViewBody(),
    );
  }
}
