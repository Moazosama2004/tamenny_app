import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamenny_app/core/theme/app_colors.dart';
import 'package:tamenny_app/core/theme/app_styles.dart';
import 'package:tamenny_app/features/home/presentation/manager/medical_news_cubit/medical_news_cubit.dart';
import 'package:tamenny_app/features/home/presentation/views/widgets/health_scan_categories_widget.dart';
import 'package:tamenny_app/features/home/presentation/views/widgets/health_tips_list_view.dart';
import 'package:tamenny_app/features/home/presentation/views/widgets/home_custom_app_bar.dart';
import 'package:tamenny_app/features/home/presentation/views/widgets/home_view_custom_header.dart';
import 'package:tamenny_app/features/home/presentation/views/widgets/main_banner_widget.dart';
import 'package:tamenny_app/features/home/presentation/views/widgets/search_text_field.dart';
import 'package:tamenny_app/features/home/presentation/views/widgets/search_view_screen.dart';
import 'package:tamenny_app/features/home/presentation/views/widgets/sliver_medical_articles_list.dart';

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
              children: [
                const HomeCustomAppBar(),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(_createRouteToSearch());
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
                const Align(
                  alignment: Alignment.centerLeft,
                  child: HomeViewCustomHeader(
                    text: "Your Recent Insights",
                  ),
                ),
              ],
            ),
          ),
          SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 3 / 2,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(
                          builder: (_) => const ScanResultScreen(
                                status: 'normal',
                                resultDescription:
                                    'No health issues were detected in this scan.',
                                adviceList: [
                                  'Maintain a healthy diet.',
                                  'Keep doing regular light exercises.',
                                  'Continue your periodic health check-ups.',
                                ],
                              )));
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 6,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.file_present,
                          color: Colors.blue, size: 40),
                      const Spacer(),
                      Text(
                        "Scan ${index + 1}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const Text(
                        "Status: Normal",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SliverToBoxAdapter(
            child: HomeViewCustomHeader(text: "Health Tips for You"),
          ),
          const SliverToBoxAdapter(
            child: HealthTipsListView(),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const HomeViewCustomHeader(text: "Latest Medical News"),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Read more',
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

Route _createRouteToSearch() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const SearchViewScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0); // Slide from bottom
      const end = Offset.zero;
      const curve = Curves.ease;

      final tween = Tween(begin: begin, end: end).chain(
        CurveTween(curve: curve),
      );

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class ScanResultScreen extends StatelessWidget {
  final String status;
  final String resultDescription;
  final List<String> adviceList;

  const ScanResultScreen({
    super.key,
    required this.status,
    required this.resultDescription,
    required this.adviceList,
  });

  Color getStatusColor(BuildContext context) {
    switch (status.toLowerCase()) {
      case 'normal':
        return Colors.green;
      case 'critical':
        return Colors.redAccent;
      case 'moderate':
        return Colors.amber;
      default:
        return Theme.of(context).colorScheme.primary;
    }
  }

  IconData getStatusIcon() {
    switch (status.toLowerCase()) {
      case 'normal':
        return Icons.check_circle_outline;
      case 'critical':
        return Icons.error_outline;
      case 'moderate':
        return Icons.warning_amber_rounded;
      default:
        return Icons.help_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.darkBackgroundColor : AppColors.grayColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Scan Result',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        foregroundColor:
            isDark ? AppColors.darkTextColor : AppColors.blueDarkColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Diagnosis Status Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color:
                    isDark ? AppColors.darkCardColor : AppColors.deepGrayColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(
                    getStatusIcon(),
                    color: getStatusColor(context),
                    size: 40,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Result: $status',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: getStatusColor(context),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          resultDescription,
                          style: TextStyle(
                            fontSize: 16,
                            color: isDark
                                ? AppColors.darkSecondaryTextColor
                                : Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Advice Title
            Text(
              "Preventive Tips",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color:
                    isDark ? AppColors.darkTextColor : AppColors.blueDarkColor,
              ),
            ),
            const SizedBox(height: 12),

            // Advice List
            ...adviceList.map(
              (advice) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    const Icon(Icons.check,
                        color: AppColors.primaryColor, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        advice,
                        style: TextStyle(
                          fontSize: 15,
                          color:
                              isDark ? AppColors.darkTextColor : Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Share logic
                    },
                    icon: const Icon(Icons.share),
                    label: const Text('مشاركة'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primaryColor,
                      side: const BorderSide(color: AppColors.primaryColor),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('تم'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
