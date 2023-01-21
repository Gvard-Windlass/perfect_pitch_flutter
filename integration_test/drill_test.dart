import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:perfect_pitch_flutter/main.dart' as app;
import 'package:perfect_pitch_flutter/settings/settings_model.dart';
import 'package:perfect_pitch_flutter/widgets/drill_action_button.dart';
import 'package:perfect_pitch_flutter/widgets/start_button.dart';

void main() {
  group('Test single pitch exercise', () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

    testWidgets('Test exercise performance', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      final singlePitchRadio = find.widgetWithText(RadioListTile<ExerciseMode>, 'single pitch');
      final beginExerciseBtn = find.byType(StartButton);
      await tester.tap(singlePitchRadio);
      await tester.tap(beginExerciseBtn);
      await tester.pumpAndSettle();
      expect(find.byType(DrillActionButton), findsNWidgets(2));
      
      Finder keyE = find.widgetWithText(ElevatedButton, 'E');
      final keyEInitialColor = (tester.firstWidget(keyE) as ElevatedButton).style!.backgroundColor;
      await tester.tap(keyE);
      await tester.pumpAndSettle();
      final keyETappedColor = (tester.firstWidget(keyE) as ElevatedButton).style!.backgroundColor;
      expect(keyEInitialColor, isNot(equals(keyETappedColor)));

      final nextBtn = find.widgetWithText(DrillActionButton, 'Next');
      await tester.tap(nextBtn);
      await tester.pumpAndSettle();

      Finder nextKeyE = find.widgetWithText(ElevatedButton, 'E');
      final nextKeyEInitialColor = (tester.firstWidget(nextKeyE) as ElevatedButton).style!.backgroundColor;
      expect(nextKeyEInitialColor.toString(), equals(keyEInitialColor.toString()));
    });
  });

  group('Test unison pitch exercise', () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

    testWidgets('Test exercise performance', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      final unisonRadio = find.widgetWithText(RadioListTile<ExerciseMode>, 'unison');
      final beginExerciseBtn = find.byType(StartButton);
      await tester.tap(unisonRadio);
      await tester.tap(beginExerciseBtn);
      await tester.pumpAndSettle();
      expect(find.byType(DrillActionButton), findsNWidgets(4));
      
      Finder keyE = find.widgetWithText(ElevatedButton, 'E');
      Finder keyFsharp = find.widgetWithText(ElevatedButton, 'F#');
      Finder chordInputText = find.textContaining('Answer');
      final chordInputInitialColor = (tester.firstWidget(chordInputText) as Text).style!.color;
      await tester.tap(keyE);
      await tester.pumpAndSettle();
      await tester.tap(keyFsharp);
      await tester.pumpAndSettle();
      expect(find.textContaining('E F#'), findsOneWidget);

      Finder resetBtn = find.widgetWithText(ElevatedButton, 'Reset');
      await tester.tap(resetBtn);
      await tester.pumpAndSettle();
      expect(find.textContaining('E F#'), findsNothing);

      await tester.tap(keyE);
      await tester.pumpAndSettle();
      await tester.tap(keyFsharp);
      await tester.pumpAndSettle();
      expect(find.textContaining('E F#'), findsOneWidget);

      Finder checkBtn = find.widgetWithText(ElevatedButton, 'Check');
      await tester.tap(checkBtn);
      await tester.pumpAndSettle();
      final chordInputCheckColor = (tester.firstWidget(chordInputText) as Text).style!.color;
      expect(chordInputInitialColor, isNot(chordInputCheckColor));

      final nextBtn = find.widgetWithText(DrillActionButton, 'Next');
      await tester.tap(nextBtn);
      await tester.pumpAndSettle();

      Finder chordInputTextNext = find.textContaining('Answer');
      final chordInputInitialNextColor = (tester.firstWidget(chordInputTextNext) as Text).style!.color;
      expect(chordInputInitialColor.toString(), equals(chordInputInitialNextColor.toString()));
    });
  });
}