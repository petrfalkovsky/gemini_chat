import 'package:google_generative_ai/google_generative_ai.dart';

/// Класс [GenerativeModelWrapper] предоставляет оболочку для работы с генеративной моделью.
/// The [GenerativeModelWrapper] class provides a wrapper for working with a generative model.
class GenerativeModelWrapper {
  /// Экземпляр генеративной модели.
  /// Instance of the generative model.
  final GenerativeModel model;

  /// Сессия чата для взаимодействия с моделью.
  /// Chat session for interacting with the model.
  final ChatSession chat;

  /// Конструктор для создания экземпляра [GenerativeModelWrapper].
  /// Constructor to create an instance of [GenerativeModelWrapper].
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
