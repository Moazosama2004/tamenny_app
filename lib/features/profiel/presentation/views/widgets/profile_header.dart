import 'package:flutter/material.dart';
import 'package:tamenny_app/core/theme/app_styles.dart';
import 'package:tamenny_app/features/auth/domain/entites/user_entity.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.user,
  });

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundImage: NetworkImage(user.userAvatarUrl),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.name, style: AppStyles.font18SemiBold),
            const SizedBox(height: 4),
            Text(user.email,
                style:
                    AppStyles.font12Regular.copyWith(color: Colors.grey[600])),
          ],
        ),
      ],
    );
  }
}
