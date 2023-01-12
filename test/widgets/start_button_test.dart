import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:perfect_pitch_flutter/widgets/start_button.dart';

Widget createStartButton() => MaterialApp(
  home: Row(
    children: const [
      StartButton(icon: Icons.home, route: '/')
    ]
  )
);

void main() {
  testWidgets('Start Button widget tests', (tester) async {
    await tester.pumpWidget(createStartButton());
    final keyFinder = find.byIcon(Icons.home);
    expect(keyFinder, findsOneWidget);
  });
}