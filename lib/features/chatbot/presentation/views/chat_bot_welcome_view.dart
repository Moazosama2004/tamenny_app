import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tamenny_app/core/routes/routes.dart';
import 'package:tamenny_app/core/widgets/custom_app_button.dart';

import '../../../../core/theme/app_colors.dart';

class ChatbotWelcomeView extends StatelessWidget {
  const ChatbotWelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Meet Tamenny AI Chatbot',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color:
                      AppColors.primaryColor, // Use the updated primary color
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Tamenny Chatbot helps you with preliminary healthcare advice. Here is what you can do with it:',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
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
              const Text(
                'How to Use the Chatbot:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color:
                      AppColors.primaryColor, // Use the updated primary color
                ),
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
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  side: const BorderSide(
                      color: AppColors
                          .primaryColor), // Use the updated primary color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 1,
                ),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context, rootNavigator: true)
                      .pushReplacementNamed(Routes.loginView);
                },
                child: const Text(
                  'Learn More About the Chatbot',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
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
}
