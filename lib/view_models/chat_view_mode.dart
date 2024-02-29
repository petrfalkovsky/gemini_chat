import 'package:flutter/material.dart';
import 'package:gemini_chat/models/generative_model.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

/// [ChatViewModel] для управления чатом в приложении Gemini Chat.
/// [ChatViewModel] for managing the chat in the Gemini Chat application.
class ChatViewModel extends ChangeNotifier {
  /// Обертка для генеративной модели.
  /// Wrapper for the generative model.
  late final GenerativeModelWrapper _modelWrapper;

  /// Конструктор для создания экземпляра [ChatViewModel].
  /// Constructor to create an instance of [ChatViewModel].
  ChatViewModel({required String apiKey}) {
    _modelWrapper = GenerativeModelWrapper(apiKey: apiKey);
  }

  /// Получение экземпляра генеративной модели.
  /// Get the instance of the generative model.
  GenerativeModel get model => _modelWrapper.model;

  /// Получение сессии чата.
  /// Get the chat session.
  ChatSession get chat => _modelWrapper.chat;
}
