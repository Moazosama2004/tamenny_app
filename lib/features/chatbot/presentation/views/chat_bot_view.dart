import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';
import 'package:tamenny_app/core/widgets/custom_app_bar.dart';
import 'package:tamenny_app/features/chatbot/presentation/views/widgets/message.dart';

class ChatBotView extends StatefulWidget {
  const ChatBotView({super.key});

  @override
  State<ChatBotView> createState() => _ChatBotViewState();
}

class _ChatBotViewState extends State<ChatBotView> {
  List messages = [];
  late TextEditingController messageController;
  late final GenerativeModel model;

  @override
  void initState() {
    messageController = TextEditingController();
    model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: 'AIzaSyBidHH7rDgxm-XBHRD3zR5pMkSGRQUwBMY',
    );
    super.initState();
  }

  addMessage() async {
    if (messageController.text != '') {
      setState(() {
        messages.add(
          {
            'text': messageController.text,
            'sender': true,
          },
        );
      });
      messageController.clear();
      final prompt = messageController.text;
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);
      setState(() {
        messages.add(
          {
            'text': response.text,
            'sender': false,
          },
        );
      });
      messageController.clear();
    }
  }

  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f3f3),
      appBar: customAppBar(context, title: 'Tamenny bot', actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            Assets.imagesMoreAppBarIcon,
          ),
        )
      ]),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Message(
                    text: messages[index]['text'],
                    isSender: messages[index]['sender']);
              },
            ),
          ),
          Container(
            // height: 70,
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 20, top: 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Send message...',
                        contentPadding: const EdgeInsets.all(16),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            )),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Assets.imagesAddMoreIcon),
                  ),
                  IconButton(
                    onPressed: () {
                      addMessage();
                    },
                    icon: SvgPicture.asset(Assets.imagesSendMessageIcon),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
