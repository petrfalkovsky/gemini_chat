// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:gemini_chat/ui/screens/widgets/message_widget.dart';
import 'package:gemini_chat/ui/theme/color_constants.dart';
import 'package:gemini_chat/view_models/chat_view_mode.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

/// Виджет чата.
/// Chat widget.
class ChatWidget extends StatefulWidget {
  /// Конструктор для создания экземпляра [ChatWidget].
  /// Constructor to create an instance of [ChatWidget].
  const ChatWidget({super.key, required this.chatViewModel});

  /// [ChatViewModel] для управления чатом.
  /// [ChatViewModel] for chat management.
  final ChatViewModel chatViewModel;

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  late final GenerativeModel _model;
  late final ChatSession _chat;

  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFieldFocus = FocusNode();
  final List<({String? text, bool fromUser})> _generatedContent =
      <({String? text, bool fromUser})>[];
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _model = widget.chatViewModel.model;
    _chat = widget.chatViewModel.chat;
  }

  /// Прокрутка вниз в [ListView] для отображения новых сообщений.
  /// Scroll down in the [ListView] to display new messages.
  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.easeOutCirc,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemBuilder: (context, idx) {
                final content = _generatedContent[idx];
                return MessageWidget(
                  text: content.text,
                  isFromUser: content.fromUser,
                );
              },
              itemCount: _generatedContent.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    autofocus: true,
                    focusNode: _textFieldFocus,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(15),
                      hintText: 'Введите сообщение...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(14),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(14),
                        ),
                      ),
                    ),
                    controller: _textController,
                    onSubmitted: _sendChatMessage,
                  ),
                ),
                const SizedBox.square(dimension: 15),
                if (!_loading)
                  IconButton(
                    onPressed: () async {
                      _sendChatMessage(_textController.text);
                    },
                    icon: Icon(
                      Icons.send,
                      color: ColorsConsts.darkBlue,
                    ),
                  )
                else
                  CircularProgressIndicator(
                    color: ColorsConsts.darkBlue,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Отправка сообщения в чат.
  /// Sending a message to the chat.
  Future<void> _sendChatMessage(String message) async {
    setState(() {
      _loading = true;
    });

    try {
      _generatedContent.add((text: message, fromUser: true));
      final response = await _chat.sendMessage(
        Content.text(message),
      );
      final text = response.text;
      _generatedContent.add((text: text, fromUser: false));

      if (text == null) {
        _showError('API не отвечает');
        return;
      } else {
        setState(() {
          _loading = false;
          _scrollDown();
        });
      }
    } catch (e) {
      _showError(e.toString());
      setState(() {
        _loading = false;
      });
    } finally {
      _textController.clear();
      setState(() {
        _loading = false;
      });
      _textFieldFocus.requestFocus();
    }
  }

  /// Отображение диалогового окна с ошибкой.
  /// Displaying a dialog with an error.
  void _showError(String message) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Что-то пошло не так'),
          content: SingleChildScrollView(
            child: SelectableText(message),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }
}
