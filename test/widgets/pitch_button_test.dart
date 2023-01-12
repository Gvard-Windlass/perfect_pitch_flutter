import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:perfect_pitch_flutter/widgets/pitch_button.dart';

Widget createPitchButton() => MaterialApp(
  home: Row(
    children: const [
      PitchButton(pitchKey: 'C', pitchEnabled: true)
    ]
  )
);

void main() {
  testWidgets('Pitch Button widget tests', (tester) async {
    await tester.pumpWidget(createPitchButton());
    final keyFinder = find.text('C');
    expect(keyFinder, findsOneWidget);
  });
}