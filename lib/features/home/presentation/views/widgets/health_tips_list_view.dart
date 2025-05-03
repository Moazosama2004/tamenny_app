import 'package:flutter/material.dart';
import 'package:tamenny_app/features/home/domain/entites/health_tip_entity.dart';
import 'package:tamenny_app/features/home/presentation/views/widgets/health_tips_item.dart';

class HealthTipsListView extends StatelessWidget {
  const HealthTipsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: healthTips.length,
        itemBuilder: (context, index) {
          return HealthTipsItem(
            healthTipEntity: healthTips[index],
          );
        },
      ),
    );
  }
}

List<HealthTipEntity> healthTips = [
  HealthTipEntity(
      tip: "Drink plenty of water daily for better health.",
      icon: Icons.water_drop),
  HealthTipEntity(
      tip: "Get 7–8 hours of sleep each night to stay energized.",
      icon: Icons.bedtime),
  HealthTipEntity(
      tip: "Take short walks to boost your mood and circulation.",
      icon: Icons.directions_walk),
  HealthTipEntity(
      tip: "Eat more fruits and veggies for a stronger immune system.",
      icon: Icons.emoji_nature),
  HealthTipEntity(
      tip: "Stretch daily to improve flexibility and reduce stress.",
      icon: Icons.self_improvement),
  HealthTipEntity(
      tip: "Limit screen time to protect your eyes and mental health.",
      icon: Icons.visibility_off),
];
