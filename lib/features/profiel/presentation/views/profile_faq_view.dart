import 'package:flutter/material.dart';
import 'package:tamenny_app/features/settings/data/models/faq_item_model.dart';
import 'package:tamenny_app/features/settings/presentation/views/widgets/expanded_list_widget.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class ProfileFaqView extends StatelessWidget {
  const ProfileFaqView({super.key});

  final List<FaqItemModel> faqItems = const [
    FaqItemModel(
        title: 'What is Tamenny?',
        content:
            'Tamenny is a healthcare app designed to provide an initial assessment of your health condition using AI, helping you make informed decisions before visiting a doctor. It aims to save you time and money by offering an accurate preliminary diagnosis.'),
    FaqItemModel(
        title: 'How does Tamenny help with my health concerns?',
        content:
            'Tamenny is a healthcare app designed to provide an initial assessment of your health condition using AI, helping you make informed decisions before visiting a doctor. It aims to save you time and money by offering an accurate preliminary diagnosis.'),
    FaqItemModel(
        title: 'Is Tamenny\'s diagnosis as accurate as a doctor’s diagnosis?',
        content:
            'Tamenny is a healthcare app designed to provide an initial assessment of your health condition using AI, helping you make informed decisions before visiting a doctor. It aims to save you time and money by offering an accurate preliminary diagnosis.'),
    FaqItemModel(
        title: 'Can I trust the results provided by Tamenny?',
        content:
            'Tamenny is a healthcare app designed to provide an initial assessment of your health condition using AI, helping you make informed decisions before visiting a doctor. It aims to save you time and money by offering an accurate preliminary diagnosis.'),
    FaqItemModel(
        title: 'How much does it cost to use Tamenny?',
        content:
            'Tamenny is a healthcare app designed to provide an initial assessment of your health condition using AI, helping you make informed decisions before visiting a doctor. It aims to save you time and money by offering an accurate preliminary diagnosis.'),
    FaqItemModel(
        title: 'How does Tamenny protect my data?',
        content:
            'Tamenny is a healthcare app designed to provide an initial assessment of your health condition using AI, helping you make informed decisions before visiting a doctor. It aims to save you time and money by offering an accurate preliminary diagnosis.'),
    FaqItemModel(
        title: 'Can I share my assessment with others?',
        content:
            'Tamenny is a healthcare app designed to provide an initial assessment of your health condition using AI, helping you make informed decisions before visiting a doctor. It aims to save you time and money by offering an accurate preliminary diagnosis.'),
    FaqItemModel(
        title: 'Who can use Tamenny?',
        content:
            'Tamenny is a healthcare app designed to provide an initial assessment of your health condition using AI, helping you make informed decisions before visiting a doctor. It aims to save you time and money by offering an accurate preliminary diagnosis.'),
    FaqItemModel(
        title: 'Can I use Tamenny if I have a pre-existing condition?',
        content:
            'Tamenny is a healthcare app designed to provide an initial assessment of your health condition using AI, helping you make informed decisions before visiting a doctor. It aims to save you time and money by offering an accurate preliminary diagnosis.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'FAQ'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Container(
          color: Colors.white,
          child: ListView.separated(
            itemBuilder: (context, index) => ExpandedListWidget(
              title: faqItems[index].title,
              content: faqItems[index].content,
            ),
            separatorBuilder: (context, index) => const Divider(
              thickness: 1,
              height: 12,
            ),
            itemCount: faqItems.length,
          ),
        ),
      ),
    );
  }
}
