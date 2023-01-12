import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:perfect_pitch_flutter/screens/home.dart';
import 'package:perfect_pitch_flutter/settings/settings_model.dart';
import 'package:perfect_pitch_flutter/widgets/mode_selection.dart';
import 'package:perfect_pitch_flutter/widgets/octave_checkbox.dart';
import 'package:perfect_pitch_flutter/widgets/octave_selection.dart';
import 'package:perfect_pitch_flutter/widgets/pitch_button.dart';
import 'package:perfect_pitch_flutter/widgets/pitch_buttons.dart';
import 'package:perfect_pitch_flutter/settings/settings_wrapper.dart';

import '../settings/mock_settings_storage.dart';

Widget createHomeSceen() => SettingsWrapper(
  storage: MockSettingsStorage(),
  child: const MaterialApp(home: Home())
);

void main() {
  testWidgets('Pitch Button widget tests', (tester) async {
    await tester.pumpWidget(createHomeSceen());
    await tester.pumpAndSettle();
    expect(find.byType(PitchButtons), findsOneWidget);
    expect(find.byType(PitchButton), findsNWidgets(12));
    expect(find.textContaining('#'), findsNWidgets(5));
  });

  testWidgets('Mode selection widget tests', (tester) async {
    await tester.pumpWidget(createHomeSceen());
    await tester.pumpAndSettle();
    expect(find.byType(ModeSelection), findsOneWidget);
    expect(find.byType(RadioListTile<ExerciseMode>), findsNWidgets(2));
  });

  testWidgets('Octave selection widget tests', (tester) async {
    await tester.pumpWidget(createHomeSceen());
    await tester.pumpAndSettle();
    expect(find.byType(OctaveSelection), findsOneWidget);
    expect(find.byType(OctaveCheckbox), findsNWidgets(7));
    
    final checkboxes = find.byType(CheckboxListTile);
    final count = tester.widgetList(checkboxes).length;
    int countChecked = 0;
    
    for (var i = 0; i < count; i++) {
      final checkbox = tester.widget(checkboxes.at(i));
      final value = (checkbox as CheckboxListTile).value;
      if (value != null) {
        if (value) {
          countChecked++;
        }
      }
    }
    expect(countChecked, equals(4));
  });
}