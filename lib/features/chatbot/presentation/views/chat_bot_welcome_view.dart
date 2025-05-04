import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:tamenny_app/features/chatbot/presentation/views/widgets/chatbot_welcome_view_body.dart';

class ChatbotWelcomeView extends StatelessWidget {
  const ChatbotWelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: const SafeArea(
        child: Scaffold(
          body: ChatbotWelcomeViewBody(),
        ),
      ),
    );
  }
}
