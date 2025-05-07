import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamenny_app/core/cubits/user_cubit/user_cubit.dart';
import 'package:tamenny_app/core/services/get_it_service.dart';
import 'package:tamenny_app/core/theme/app_styles.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundImage: NetworkImage(
              context.watch<UserCubit>().currentUser!.userAvatarUrl),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.read<UserCubit>().currentUser!.name,
                style: AppStyles.font18SemiBold),
            const SizedBox(height: 4),
            Text(context.read<UserCubit>().currentUser!.email,
                style:
                    AppStyles.font12Regular.copyWith(color: Colors.grey[600])),
          ],
        ),
      ],
    );
  }
}
