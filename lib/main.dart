import 'package:flutter/material.dart';
import 'package:gemini_chat/ui/screens/chat_screen.dart';
import 'package:gemini_chat/ui/theme/color_constants.dart';

void main() {
  runApp(const GenerativeAI());
}

/// Основной виджет приложения, наследуемый от [StatelessWidget].
/// Main widget of the application, extending [StatelessWidget].
class GenerativeAI extends StatelessWidget {
  /// Конструктор для создания экземпляра [GenerativeAI].
  /// Constructor to create an instance of [GenerativeAI].
  const GenerativeAI({super.key});

  /// Метод [build], который определяет структуру виджета.
  /// The [build] method that defines the structure of the widget.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// Отключаем отображение баннера для отладки.
      /// Disable the display of the debug banner.
      debugShowCheckedModeBanner: false,

      /// Устанавливаем заголовок приложения.
      /// Set the title of the application.
      title: 'Gemini on Flutter',

      /// Задаем тему оформления приложения.
      /// Set the theme of the application.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: ColorsConsts.blue,
        ),
        useMaterial3: true,
      ),

      /// Устанавливаем экран чата в качестве основного домашнего экрана.
      /// Set the chat screen as the main home screen.
      home: const ChatScreen(title: 'Gemini \u{1FAE1}'),
    );
  }
}
