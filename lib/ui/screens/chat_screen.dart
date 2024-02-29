import 'package:flutter/material.dart';
import 'package:gemini_chat/config.dart';
import 'package:gemini_chat/ui/screens/widgets/chat_widget.dart';
import 'package:gemini_chat/view_models/chat_view_mode.dart';

/// [ChatScreen] экран в приложении Gemini Chat.
/// [ChatScreen] screen in the Gemini Chat application.
class ChatScreen extends StatefulWidget {
  /// Конструктор для создания экземпляра ChatScreen.
  /// Constructor to create an instance of ChatScreen.
  const ChatScreen({super.key, required this.title});

  /// Заголовок экрана.
  /// Screen title.
  final String title;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final ChatViewModel _chatViewModel;

  @override
  void initState() {
    super.initState();

    /// Инициализация ViewModel для управления чатом.
    /// Initialization of the ViewModel for chat management.
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
