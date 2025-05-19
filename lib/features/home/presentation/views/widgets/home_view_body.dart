import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamenny_app/core/routes/routes.dart';
import 'package:tamenny_app/core/theme/app_colors.dart';
import 'package:tamenny_app/core/theme/app_styles.dart';
import 'package:tamenny_app/features/home/presentation/manager/medical_news_cubit/medical_news_cubit.dart';
import 'package:tamenny_app/features/home/presentation/views/functions/create_animation_from_search_text_field.dart';
import 'package:tamenny_app/features/home/presentation/views/widgets/health_scan_categories_widget.dart';
import 'package:tamenny_app/features/home/presentation/views/widgets/health_tips_list_view.dart';
import 'package:tamenny_app/features/home/presentation/views/widgets/home_custom_app_bar.dart';
import 'package:tamenny_app/features/home/presentation/views/widgets/home_view_custom_header.dart';
import 'package:tamenny_app/features/home/presentation/views/widgets/latest_medical_news_sliver_list.dart';
import 'package:tamenny_app/features/home/presentation/views/widgets/latest_scans_bloc_builder.dart';
import 'package:tamenny_app/features/home/presentation/views/widgets/main_banner_widget.dart';
import 'package:tamenny_app/features/home/presentation/views/widgets/nearby_doctors_sliver_list_bloc_builder.dart';
import 'package:tamenny_app/features/home/presentation/views/widgets/search_text_field.dart';
import 'package:tamenny_app/features/map/presentation/manager/nearby_doctors_cubit/nearby_doctors_cubit.dart';
import 'package:tamenny_app/generated/l10n.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<MedicalNewsCubit>().getMedicalNews();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeCustomAppBar(),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(createRouteToSearch());
                  },
                  child: const AbsorbPointer(
                    child: SearchTextField(),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const MainBannerWidget(),
                const SizedBox(
                  height: 12,
                ),
                const HealthScanCategoriesWidget(),
                HomeViewCustomHeader(text: S.of(context).yourRecentInsights),
              ],
            ),
          ),
          const LatestScansBlocBuilder(),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeViewCustomHeader(
                  text: S.of(context).nearbyDoctors,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).pushNamed(
                        Routes.nearbyDoctorsListView,
                        arguments:
                            context.read<NearbyDoctorsCubit>().doctorsList);
                  },
                  child: Text(
                    S.of(context).readMore,
                    style: AppStyles.font12Regular.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          const NearbyDoctorsSliverListBlocBuilder(),
          SliverToBoxAdapter(
            child: HomeViewCustomHeader(
              text: S.of(context).healthTipsForYou,
            ),
          ),
          const SliverToBoxAdapter(
            child: HealthTipsListView(),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeViewCustomHeader(
                  text: S.of(context).latestMedicalNews,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).pushNamed(
                        Routes.latestMedicalNewsView,
                        arguments:
                            context.read<MedicalNewsCubit>().articlesList);
                  },
                  child: Text(
                    S.of(context).readMore,
                    style: AppStyles.font12Regular.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SliverMedicalArticlesList(),
        ],
      ),
    );
  }
}
