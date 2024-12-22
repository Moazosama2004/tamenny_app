import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';
import 'package:tamenny_app/features/delete/delete_view.dart';
import 'package:tamenny_app/features/home/presentation/views/home_view.dart';
import 'package:tamenny_app/features/profiel/presentation/views/profile_view.dart';
import 'package:tamenny_app/features/search/presentation/views/search_view.dart';
import 'package:tamenny_app/features/settings/presentation/views/settings_view.dart';
import 'package:tamenny_app/features/scan/presentation/views/scan_view.dart';
import '../../../../chatbot/presentation/views/chat_bot_welcome_view.dart';
import '../../../../community/presentation/views/community_view.dart';

PersistentTabController _controller = PersistentTabController();

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      backgroundColor: Colors.white,
      navBarStyle: NavBarStyle.style16,
      decoration: const NavBarDecoration(),
    );
  }

  List<Widget> _buildScreens() {
    return [
      const HomeView(),
      const CommunityView(),
      const SearchView(),
      const ChatbotWelcomeView(),
      const ProfileView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.imagesHomeActiveIcon),
        inactiveIcon: SvgPicture.asset(Assets.imagesHomeInactiveIcon),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.imagesCommunityActiveIcon),
        inactiveIcon: SvgPicture.asset(Assets.imagesCommunityInactiveIcon),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.imagesSearchIcon),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.imagesCalendarActiveIcon),
        inactiveIcon: SvgPicture.asset(Assets.imagesCalendarInactiveIcon),
      ),
      PersistentBottomNavBarItem(
        icon: Opacity(
          opacity: 0.6,
          child: CircleAvatar(
            radius: 12,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(555),
                child: Image.asset(Assets.imagesProfiel)),
          ),
        ),
        inactiveIcon: CircleAvatar(
          radius: 12,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(555),
              child: Image.asset(Assets.imagesProfiel)),
        ),
      ),
    ];
  }
}
