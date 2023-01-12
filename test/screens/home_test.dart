import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:perfect_pitch_flutter/screens/home.dart';
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
}