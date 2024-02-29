import 'package:flutter/material.dart';
import 'package:gemini_chat/ui/screens/chat_screen.dart';
import 'package:gemini_chat/ui/theme/color_constants.dart';

void main() {
  runApp(const GenerativeAISample());
}

class GenerativeAISample extends StatelessWidget {
  const GenerativeAISample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gemini on Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: ColorsConsts.blue,
        ),
        useMaterial3: true,
      ),
      home: const ChatScreen(title: 'Gemini \u{1FAE1}'),
    );
  }
}
