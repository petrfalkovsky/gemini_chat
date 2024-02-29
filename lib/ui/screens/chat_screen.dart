import 'package:flutter/material.dart';
import 'package:gemini_chat/config.dart';
import 'package:gemini_chat/ui/screens/widgets/chat_widget.dart';
import 'package:gemini_chat/view_models/chat_view_mode.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.title});

  final String title;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final ChatViewModel _chatViewModel;

  @override
  void initState() {
    super.initState();
    _chatViewModel = ChatViewModel(apiKey: AppConfig.apiKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ChatWidget(chatViewModel: _chatViewModel),
    );
  }
}
