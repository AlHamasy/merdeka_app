// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:merdeka_app/controllers/news_controller.dart';

import 'package:merdeka_app/main.dart';

void main() {
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyApp());
  //
  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);
  //
  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();
  //
  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });

  // test('add should return the sum of two numbers', () {
  //   // Arrange
  //   int a = 2;
  //   int b = 3;
  //
  //   // Act
  //   int result = a + b;
  //
  //   // Assert
  //   expect(result, 4);
  // });

  late NewsController newsController;

  setUp((){
    newsController = NewsController();
  });

  test('tambah 1', (){
    newsController.increment();
    expect(newsController.counter.value, 1);
  });

  test('kurang 1', (){
    newsController.decrement();
    expect(newsController.counter.value, -1);
  });


}