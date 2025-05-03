import 'package:flutter/material.dart';
import 'package:tamenny_app/core/theme/app_colors.dart';
import 'package:tamenny_app/core/theme/app_styles.dart';

class Message extends StatelessWidget {
  const Message({super.key, required this.text, required this.isSender});

  final String text;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: isSender ? AppColors.primaryColor : Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8,
              ),
              child: Text(
                text,
                style: AppStyles.font14Regular.copyWith(
                  color: isSender ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// AIzaSyBidHH7rDgxm-XBHRD3zR5pMkSGRQUwBMY
