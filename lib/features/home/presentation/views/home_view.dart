import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import 'widgets/health_scan_categories_widget.dart';
import 'widgets/home_custom_app_bar.dart';
import 'widgets/main_banner_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: HomeCustomAppBar(),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 27,
                  ),
                ),
                SliverToBoxAdapter(
                  child: MainBannerWidget(),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 24,
                  ),
                ),
                SliverToBoxAdapter(
                  child: HealthScanCategoriesWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
