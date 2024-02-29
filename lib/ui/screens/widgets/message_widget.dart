import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

/// Виджет для отображения сообщения в чате.
/// Widget to display a message in the chat.
class MessageWidget extends StatelessWidget {
  /// Конструктор для создания экземпляра [MessageWidget].
  /// Constructor to create an instance of [MessageWidget].
  const MessageWidget({
    super.key,
    this.text,
    required this.isFromUser,
  });

  /// Текст сообщения.
  /// Message text.
  final String? text;

  /// Флаг, определяющий, является ли сообщение от пользователя.
  /// Flag determining if the message is from the user.
  final bool isFromUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 520),
            decoration: BoxDecoration(
              color: isFromUser
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(18),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            margin: const EdgeInsets.only(bottom: 8),
            child: Column(
              children: [
                if (text != null) MarkdownBody(data: text!),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
