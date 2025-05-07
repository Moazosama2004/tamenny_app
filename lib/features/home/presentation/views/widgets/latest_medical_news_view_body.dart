import 'package:flutter/material.dart';
import 'package:tamenny_app/features/home/domain/entites/article_entity.dart';
import 'package:tamenny_app/features/home/presentation/views/widgets/medical_article_item.dart';

class LatestMedicalNewsViewBody extends StatelessWidget {
  const LatestMedicalNewsViewBody({super.key, required this.articles});
  final List<ArticleEntity> articles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) => MedicalArticleItem(
        article: articles[index],
      ),
    );
  }
}
