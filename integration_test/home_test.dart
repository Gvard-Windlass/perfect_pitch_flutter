import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:perfect_pitch_flutter/main.dart' as app;
import 'package:perfect_pitch_flutter/widgets/pitch_button.dart';

void main() {
  group('Test pitch buttons', () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

    testWidgets('Test keyboard layout', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      expect(find.byType(PitchButton), findsNWidgets(12));
      expect(find.textContaining('#'), findsNWidgets(5));
    });

    testWidgets('Test button clicks', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      Finder whiteKey = find.widgetWithText(ElevatedButton, 'C');
      final whiteKeyInitialColor = (tester.firstWidget(whiteKey) as ElevatedButton).style!.backgroundColor;
      await tester.tap(whiteKey);
      await tester.pumpAndSettle();
      final whiteKeyTappedColor = (tester.firstWidget(whiteKey) as ElevatedButton).style!.backgroundColor;
      expect(whiteKeyInitialColor, isNot(equals(whiteKeyTappedColor)));
    });
  });
}