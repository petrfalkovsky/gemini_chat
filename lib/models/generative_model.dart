import 'package:google_generative_ai/google_generative_ai.dart';

class GenerativeModelWrapper {
  final GenerativeModel model;
  final ChatSession chat;

  GenerativeModelWrapper({required String apiKey})
      : model = GenerativeModel(
          model: 'gemini-pro',
          apiKey: apiKey,
        ),
        chat = GenerativeModel(
          model: 'gemini-pro',
          apiKey: apiKey,
        ).startChat();
}
