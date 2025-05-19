import 'package:flutter/material.dart';
import 'package:tamenny_app/core/theme/app_styles.dart';
import 'package:tamenny_app/generated/l10n.dart';

class ProfilePrivacyCenterViewBody extends StatelessWidget {
  const ProfilePrivacyCenterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              locale.privacyMattersTitle,
              style: AppStyles.font20SemiBold.copyWith(color: Colors.black),
            ),
            const SizedBox(height: 12),
            Text(
              locale.privacyIntroText,
              style: AppStyles.font16Regular.copyWith(color: Colors.black87),
            ),
            const SizedBox(height: 24),
            _sectionTitle(locale.whatWeCollectTitle),
            _sectionBody([
              locale.whatWeCollectItem1,
              locale.whatWeCollectItem2,
              locale.whatWeCollectItem3,
            ]),
            Text(
              locale.noSensitiveDataNote,
              style: AppStyles.font16Regular.copyWith(color: Colors.black45),
            ),
            const SizedBox(height: 24),
            _sectionTitle(locale.howWeUseDataTitle),
            _sectionBody([
              locale.howWeUseDataItem1,
              locale.howWeUseDataItem2,
              locale.howWeUseDataItem3,
            ]),
            Text(
              locale.noAdsOrSellingNote,
              style: AppStyles.font16Regular.copyWith(color: Colors.black45),
            ),
            const SizedBox(height: 24),
            _sectionTitle(locale.thirdPartyServicesTitle),
            Text(
              locale.thirdPartyServicesDescription,
              style: AppStyles.font16Regular.copyWith(color: Colors.black87),
            ),
            const SizedBox(height: 24),
            _sectionTitle(locale.yourControlsTitle),
            _sectionBody([
              locale.yourControlsItem1,
              locale.yourControlsItem2,
              locale.yourControlsItem3,
            ]),
            Text(
              locale.transparencyNote,
              style: AppStyles.font16Regular.copyWith(color: Colors.black45),
            ),
            const SizedBox(height: 24),
            _sectionTitle(locale.contactUsTitle),
            Text(
              locale.contactUsDescription,
              style: AppStyles.font16Regular.copyWith(color: Colors.black87),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: AppStyles.font18SemiBold.copyWith(color: Colors.black),
    );
  }

  Widget _sectionBody(List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: items
            .map((item) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("• ", style: TextStyle(fontSize: 16)),
                    Expanded(
                        child: Text(
                      item,
                      style: AppStyles.font16Regular
                          .copyWith(color: Colors.black87),
                    )),
                  ],
                ))
            .toList(),
      ),
    );
  }
}
