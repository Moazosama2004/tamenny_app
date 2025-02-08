import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/utils/app_assets.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xffE9FAEF),
          child: SvgPicture.asset(Assets.imagesCalendarCompletedIcon),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Scan Analysis Completed',
                style: AppStyles.font14SemiBold.copyWith(
                  color: Colors.black,
                ),
              ),
              Text(
                'Your lung scan has been successfully analyzed. No major issues were detected. We recommend regular check-ups to stay informed about your health.',
                style: AppStyles.font12Regular.copyWith(
                  color: const Color(0xff757575),
                ),
              ),
            ],
          ),
        ),
        Text(
          '1h',
          style: AppStyles.font10Regular.copyWith(
            color: const Color(0xff9E9E9E),
          ),
        )
      ],
    );
  }
}
