import 'package:flutter/material.dart';
import 'package:tamenny_app/core/theme/app_styles.dart';
import 'package:tamenny_app/core/widgets/custom_app_bar.dart';
import 'package:tamenny_app/generated/l10n.dart';

class ProfilePrivacyCenterScreen extends StatelessWidget {
  const ProfilePrivacyCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
      appBar: customAppBar(context, title: s.privacyCenterTitle),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                s.privacyMattersTitle,
                style: AppStyles.font20SemiBold.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 12),
              Text(
                s.privacyIntroText,
                style: AppStyles.font16Regular.copyWith(color: Colors.black87),
              ),
              const SizedBox(height: 24),
              _sectionTitle(s.whatWeCollectTitle),
              _sectionBody([
                s.whatWeCollectItem1,
                s.whatWeCollectItem2,
                s.whatWeCollectItem3,
              ]),
              Text(
                s.noSensitiveDataNote,
                style: AppStyles.font16Regular.copyWith(color: Colors.black45),
              ),
              const SizedBox(height: 24),
              _sectionTitle(s.howWeUseDataTitle),
              _sectionBody([
                s.howWeUseDataItem1,
                s.howWeUseDataItem2,
                s.howWeUseDataItem3,
              ]),
              Text(
                s.noAdsOrSellingNote,
                style: AppStyles.font16Regular.copyWith(color: Colors.black45),
              ),
              const SizedBox(height: 24),
              _sectionTitle(s.thirdPartyServicesTitle),
              Text(
                s.thirdPartyServicesDescription,
                style: AppStyles.font16Regular.copyWith(color: Colors.black87),
              ),
              const SizedBox(height: 24),
              _sectionTitle(s.yourControlsTitle),
              _sectionBody([
                s.yourControlsItem1,
                s.yourControlsItem2,
                s.yourControlsItem3,
              ]),
              Text(
                s.transparencyNote,
                style: AppStyles.font16Regular.copyWith(color: Colors.black45),
              ),
              const SizedBox(height: 24),
              _sectionTitle(s.contactUsTitle),
              Text(
                s.contactUsDescription,
                style: AppStyles.font16Regular.copyWith(color: Colors.black87),
              ),
              const SizedBox(height: 32),
            ],
          ),
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
