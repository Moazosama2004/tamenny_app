import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tamenny_app/core/routes/routes.dart';
import 'package:tamenny_app/core/theme/app_colors.dart';
import 'package:tamenny_app/core/theme/app_styles.dart';
import 'package:tamenny_app/core/widgets/custom_app_button.dart';

class ChatbotWelcomeViewBody extends StatelessWidget {
  const ChatbotWelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Meet Tamenny AI Chatbot',
                  style: AppStyles.font26Bold,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Tamenny Chatbot helps you with preliminary healthcare advice. Here is what you can do with it:',
                  style: AppStyles.font16Regular,
                ),
                const SizedBox(height: 20),
                _buildFeatureRow(
                  icon: Icons.check_circle,
                  text: 'Ask questions about your health conditions.',
                ),
                const SizedBox(height: 10),
                _buildFeatureRow(
                  icon: Icons.check_circle,
                  text: 'Get recommendations on your next steps.',
                ),
                const SizedBox(height: 10),
                _buildFeatureRow(
                  icon: Icons.check_circle,
                  text: 'Learn about health-related topics with ease.',
                ),
                const SizedBox(height: 30),
                Text(
                  'How to Use the Chatbot:',
                  style: AppStyles.font20Bold
                      .copyWith(color: AppColors.primaryColor),
                ),
                const SizedBox(height: 10),
                const Text(
                  '1. Tap the "Start Chatting" button below.\n'
                  '2. Ask any question related to your health.\n'
                  '3. Get instant, AI-powered responses customized for you.',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                const Spacer(),
                CustomAppButton(
                  text: 'Start Chatting',
                  onTap: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamed(Routes.chatBotView);
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Row _buildFeatureRow({required IconData icon, required String text}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(icon, color: AppColors.primaryColor),
      const SizedBox(width: 10),
      Expanded(
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    ],
  );
}
