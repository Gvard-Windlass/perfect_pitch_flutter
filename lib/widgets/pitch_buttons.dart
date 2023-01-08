import 'package:flutter/material.dart';
import 'pitch_button.dart';
import 'package:perfect_pitch_flutter/settings/settings_wrapper.dart';

class PitchButtons extends StatelessWidget {
  // TODO add function pass for reusing buttons in drill
  const PitchButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (MapEntry e in SettingsWrapper.of(context).whiteKeys.entries)
              PitchButton(pitchKey: e.key, pitchEnabled: e.value)
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
              PitchButton(pitchKey: e.key, pitchEnabled: e.value),
            // gap between D# and F#
            Flexible(
              child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: PitchButton.pitchBtnSymmetricPadding),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: PitchButton.pitchBtnMaxWidth), 
                child: const AspectRatio(aspectRatio: 1/3)
            ))),
            for (MapEntry e in SettingsWrapper.of(context).blackKeys.entries.skip(2))
              PitchButton(pitchKey: e.key, pitchEnabled: e.value),
          ]
        )
      ],
    );
  }
}