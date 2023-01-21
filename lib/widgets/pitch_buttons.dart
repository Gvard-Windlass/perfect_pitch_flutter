import 'package:flutter/material.dart';
import 'package:perfect_pitch_flutter/widgets/pitch_actions.dart';
import 'pitch_button.dart';
import 'package:perfect_pitch_flutter/settings/settings_wrapper.dart';

enum PitchActionSet {settingsActions, drillActions}

class PitchButtons extends StatelessWidget {
  const PitchButtons({super.key, required this.actionSet});
  final PitchActionSet actionSet;

  @override
  Widget build(BuildContext context) {
    final PitchActions actions;
    switch (actionSet) {
      case PitchActionSet.settingsActions:
        actions = SettingsPitchActions();
        break;
      case PitchActionSet.drillActions:
        actions = ExercisePitchActions();
        break;
      default:
        actions = SettingsPitchActions();
    }
    
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (MapEntry e in SettingsWrapper.of(context).whiteKeys.entries)
              PitchButton(pitchKey: e.key, pitchEnabled: e.value, actions: actions)
          ]
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: ConstrainedBox(constraints: 
                const BoxConstraints(maxWidth: PitchButton.pitchBtnMaxWidth))
            ),
            for (MapEntry e in SettingsWrapper.of(context).blackKeys.entries.take(2))
              PitchButton(pitchKey: e.key, pitchEnabled: e.value, actions: actions),
            // gap between D# and F#
            Flexible(
              child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: PitchButton.pitchBtnSymmetricPadding),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: PitchButton.pitchBtnMaxWidth), 
                child: const AspectRatio(aspectRatio: 1/3)
            ))),
            for (MapEntry e in SettingsWrapper.of(context).blackKeys.entries.skip(2))
              PitchButton(pitchKey: e.key, pitchEnabled: e.value, actions: actions),
          ]
        )
      ],
    );
  }
}