import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:perfect_pitch_flutter/exercise/exercise_wrapper.dart';
import 'package:perfect_pitch_flutter/player/player.dart';
import 'package:perfect_pitch_flutter/screens/drill.dart';
import 'package:perfect_pitch_flutter/settings/settings_wrapper.dart';
import 'package:perfect_pitch_flutter/widgets/chord_input_text.dart';
import 'package:perfect_pitch_flutter/widgets/drill_action_button.dart';
import 'package:perfect_pitch_flutter/widgets/pitch_button.dart';
import 'package:perfect_pitch_flutter/widgets/pitch_buttons.dart';

import '../exercise/mock_exercise.dart';
import '../settings/mock_settings_storage.dart';
import '../test_helpers.dart';

Widget createDrillSingleScreen() => SettingsWrapper(
  storage: MockSettingsStorage(),
  child: MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => ExerciseWrapper(
        exercise: MockExerciseSingle(context: context, player: Player()),
        child: Drill(), 
      )
    },
  ), 
);

Widget createDrillUnisonScreen() => SettingsWrapper(
  storage: MockSettingsStorageUnison(),
  child: MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => ExerciseWrapper(
        exercise: MockExerciseUnison(context: context, player: Player()),
        child: Drill(), 
      )
    },
  ), 
);

void main() {
  group('Exercise Single tests', () {
    testWidgets('Pitch Button widget tests', (tester) async {
      FlutterError.onError = ignoreOverflowErrors;
      await tester.pumpWidget(createDrillSingleScreen());
      await tester.pumpAndSettle();
      expect(find.byType(PitchButtons), findsOneWidget);
      expect(find.byType(PitchButton), findsNWidgets(12));
      expect(find.textContaining('#'), findsNWidgets(5));
    });

    testWidgets('Drill Action Button widget tests', (tester) async {
      FlutterError.onError = ignoreOverflowErrors;
      await tester.pumpWidget(createDrillSingleScreen());
      await tester.pumpAndSettle();
      expect(find.byType(DrillActionButton), findsNWidgets(2));
    });

    testWidgets('Correcteness text tests', (tester) async {
      FlutterError.onError = ignoreOverflowErrors;
      await tester.pumpWidget(createDrillSingleScreen());
      await tester.pumpAndSettle();
      expect(find.text('0/1'), findsOneWidget);
    });
  });

  group('Exercise Unison tests', () {
    testWidgets('Pitch Button widget tests', (tester) async {
      FlutterError.onError = ignoreOverflowErrors;
      await tester.pumpWidget(createDrillUnisonScreen());
      await tester.pumpAndSettle();
      expect(find.byType(PitchButtons), findsOneWidget);
      expect(find.byType(PitchButton), findsNWidgets(12));
      expect(find.textContaining('#'), findsNWidgets(5));
    });

    testWidgets('Drill Action Button widget tests', (tester) async {
      FlutterError.onError = ignoreOverflowErrors;
      await tester.pumpWidget(createDrillUnisonScreen());
      await tester.pumpAndSettle();
      expect(find.byType(DrillActionButton), findsNWidgets(4));
    });

    testWidgets('Correcteness text tests', (tester) async {
      FlutterError.onError = ignoreOverflowErrors;
      await tester.pumpWidget(createDrillUnisonScreen());
      await tester.pumpAndSettle();
      expect(find.text('0/1'), findsOneWidget);
    });

    testWidgets('Chord Input Text tests', (tester) async {
      FlutterError.onError = ignoreOverflowErrors;
      await tester.pumpWidget(createDrillUnisonScreen());
      await tester.pumpAndSettle();
      expect(find.byType(ChordInputText), findsOneWidget);
    });
  });
}