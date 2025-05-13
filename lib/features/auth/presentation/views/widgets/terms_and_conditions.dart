import 'package:flutter/material.dart';
import 'package:tamenny_app/generated/l10n.dart';

import '../../../../../core/theme/app_styles.dart';

class TermsAndConditionsAndPrivacyPolicy extends StatelessWidget {
  const TermsAndConditionsAndPrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
            text: S.of(context).agreeLogging,
            style: AppStyles.font12Regular.copyWith(
              color: const Color(0xff9E9E9E),
            ),
          ),
          TextSpan(
            text: S.of(context).termsAndConditions,
            style: AppStyles.font14Medium.copyWith(
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: S.of(context).and,
            style: AppStyles.font12Regular.copyWith(
              color: const Color(0xff9E9E9E),
            ),
          ),
          TextSpan(
            text: S.of(context).privacyPolicy,
            style: AppStyles.font14Medium.copyWith(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
