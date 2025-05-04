import 'package:flutter/material.dart';
import 'package:tamenny_app/core/theme/app_styles.dart';
import 'package:tamenny_app/core/widgets/custom_app_bar.dart';

class ProfilePrivacyCenterScreen extends StatelessWidget {
  const ProfilePrivacyCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Privacy Center'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Privacy Matters',
                style: AppStyles.font20SemiBold.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 12),
              Text(
                'At Tamenny, your privacy is one of our top priorities. We are committed to protecting your personal information and ensuring that you always remain in control of your data. This Privacy Center is designed to help you understand what we collect, how we use it, and the choices you have.',
                style: AppStyles.font16Regular.copyWith(color: Colors.black87),
              ),
              const SizedBox(height: 24),
              _sectionTitle('What We Collect'),
              _sectionBody([
                'Preferred language (Arabic / English)',
                'Display settings (Dark Mode / Light Mode)',
                'General usage data (anonymous and non-identifiable)',
              ]),
              Text(
                'We do not collect any sensitive personal data.',
                style: AppStyles.font16Regular.copyWith(color: Colors.black45),
              ),
              const SizedBox(height: 24),
              _sectionTitle('How We Use Your Data'),
              _sectionBody([
                'Personalize your app experience',
                'Remember your preferences',
                'Improve app performance and reliability',
              ]),
              Text(
                'Your data is never used for advertising purposes or sold to third parties.',
                style: AppStyles.font16Regular.copyWith(color: Colors.black45),
              ),
              const SizedBox(height: 24),
              _sectionTitle('Third-Party Services'),
              Text(
                'Tamenny may use trusted third-party services (such as Firebase or analytics tools) to help us understand app usage and improve functionality. These services process data anonymously and securely.',
                style: AppStyles.font16Regular.copyWith(color: Colors.black87),
              ),
              const SizedBox(height: 24),
              _sectionTitle('Your Controls'),
              _sectionBody([
                'Change your language',
                'Toggle Dark Mode on or off',
                'Review app permissions',
              ]),
              Text(
                'We believe in transparency and give you the tools to adjust your experience at any time.',
                style: AppStyles.font16Regular.copyWith(color: Colors.black45),
              ),
              const SizedBox(height: 24),
              _sectionTitle('📩 Contact Us'),
              Text(
                'If you have any questions or concerns about your privacy, please contact us at:\n\nsupport@tamenny.app',
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
