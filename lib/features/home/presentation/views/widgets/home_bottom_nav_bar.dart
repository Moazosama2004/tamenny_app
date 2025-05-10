import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:tamenny_app/core/cubits/user_cubit/user_cubit.dart';
import 'package:tamenny_app/core/functions/get_user_entity.dart';
import 'package:tamenny_app/core/services/get_it_service.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';
import 'package:tamenny_app/features/community/presentation/manager/community_cubit/community_cubit.dart';
import 'package:tamenny_app/features/home/presentation/views/home_view.dart';
import 'package:tamenny_app/features/map/presentation/views/nearby_doctors_view.dart';
import 'package:tamenny_app/features/profiel/presentation/views/profile_view.dart';
import 'package:tamenny_app/features/search/presentation/views/search_view.dart';

import '../../../../chatbot/presentation/views/chat_bot_welcome_view.dart';
import '../../../../community/presentation/views/community_view.dart';

PersistentTabController _controller = PersistentTabController(initialIndex: 0);

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

// style 5 , 6
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(context),
      backgroundColor: Colors.white,
      navBarStyle: NavBarStyle.style6,
      decoration: const NavBarDecoration(),
    );
  }

  List<Widget> _buildScreens() {
    return [
      const HomeView(),
      const CommunityView(),
      const ChatbotWelcomeView(),
      const NearbyDoctorsView(),
      const ProfileView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.imagesHomeActiveIcon),
        inactiveIcon: SvgPicture.asset(Assets.imagesHomeInactiveIcon),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          Assets.imagesGroupFillIcon,
          width: 35,
        ),
        inactiveIcon: SvgPicture.asset(
          Assets.imagesGroupLightIcon,
          width: 35,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          Assets.imagesRobotFillIcon,
          width: 35,
        ),
        inactiveIcon: SvgPicture.asset(
          Assets.imagesRobotLightIcon,
          width: 30,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          Assets.imagesMapFillIcon,
          width: 35,
        ),
        inactiveIcon: SvgPicture.asset(
          Assets.imagesMapLightIcon,
          width: 35,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Opacity(
          opacity: 0.6,
          child: CircleAvatar(
            radius: 12,
            backgroundImage: NetworkImage(
                context.watch<UserCubit>().currentUser!.userAvatarUrl),
          ),
        ),
        inactiveIcon: CircleAvatar(
          radius: 12,
          backgroundImage: NetworkImage(
              context.watch<UserCubit>().currentUser!.userAvatarUrl),
        ),
      ),
    ];
  }
}
