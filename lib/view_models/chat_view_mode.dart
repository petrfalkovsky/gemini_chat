import 'package:flutter/material.dart';
import 'package:gemini_chat/models/generative_model.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatViewModel extends ChangeNotifier {
  late final GenerativeModelWrapper _modelWrapper;

  ChatViewModel({required String apiKey}) {
    _modelWrapper = GenerativeModelWrapper(apiKey: apiKey);
  }

  GenerativeModel get model => _modelWrapper.model;
  ChatSession get chat => _modelWrapper.chat;
}
