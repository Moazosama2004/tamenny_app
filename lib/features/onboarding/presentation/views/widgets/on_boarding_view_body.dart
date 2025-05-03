import 'package:flutter/material.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';
import 'package:tamenny_app/features/onboarding/domain/entites/on_boarding_entity.dart';
import 'package:tamenny_app/features/onboarding/presentation/views/widgets/on_boarding_button_section.dart';
import 'package:tamenny_app/features/onboarding/presentation/views/widgets/on_boarding_page_view_body.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  PageController controller = PageController();

  final List<OnBoardingEntity> onBoardingEntites = const [
    OnBoardingEntity(
      numberOfStep: 'Step One',
      image: Assets.imagesOnboarding2,
      textDesc: 'Accurate Health Insights, Just For You',
    ),
    OnBoardingEntity(
      numberOfStep: 'Step Two',
      image: Assets.imagesOnboarding3,
      textDesc: 'AI-Driven Results, Personalized Care',
    ),
    OnBoardingEntity(
      numberOfStep: 'Step Three',
      image: Assets.imagesOnboarding4,
      textDesc: 'Connect, Share, And Grow Together.',
    ),
  ];

  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: controller,
          onPageChanged: (index) {
            setState(
              () {
                currentPageIndex = index;
              },
            );
          },
          itemBuilder: (context, index) {
            return OnBoardingPageViewBody(
              controller: controller,
              onBoardingEntity: onBoardingEntites[index],
            );
          },
          itemCount: onBoardingEntites.length,
        ),
        BottomSection(
          controller: controller,
          currentPage: currentPageIndex,
        ),
      ],
    );
  }
}
