import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gemini_chat/ui/screens/chat_screen.dart';
import 'package:gemini_chat/ui/screens/widgets/chat_widget.dart'; // Замените на путь к вашему ChatScreen

void main() {
  testWidgets('ChatWidget UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ChatScreen(title: 'Test Title'),
      ),
    );

    // есть ли ChatWidget в дереве виджетов
    expect(find.byType(ChatWidget), findsOneWidget);

    // работает ли ввод текста
    await tester.enterText(find.byType(TextField), 'Test message');

    // тап по кнопке отправки сообщения
    await tester.tap(find.byType(IconButton), warnIfMissed: false);

    // ждем завершения процесса загрузки
    await tester.pumpAndSettle();

    // прверили закончилась ли работать прогрессбар
    expect(find.byType(CircularProgressIndicator), findsNothing);

    // отправилось сообщение?
    expect(find.text('Test message'), findsOneWidget);

    // еще одно сообщение вводим
    await tester.enterText(find.byType(TextField), 'Another message');

    // тапаем еще раз
    await tester.tap(find.byType(IconButton), warnIfMissed: false);

    // снова ждем завершения процесса загрузки
    await tester.pumpAndSettle();

    // прверили закончилась ли работать прогрессбар
    expect(find.byType(CircularProgressIndicator), findsNothing);

    // проверям отправилось ли еще одно сообщение
    expect(find.text('Another message'), findsOneWidget);
  });
}
