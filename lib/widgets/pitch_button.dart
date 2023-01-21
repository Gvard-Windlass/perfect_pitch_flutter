import 'package:flutter/material.dart';
import 'package:perfect_pitch_flutter/widgets/pitch_actions.dart';

class PitchButton extends StatelessWidget {
  const PitchButton({super.key, required this.pitchKey, required this.pitchEnabled, required this.actions});
  final String pitchKey;
  final bool pitchEnabled;
  final PitchActions actions;

  static const double pitchBtnMaxWidth = 70;
  static const double pitchBtnSymmetricPadding = 4;

  @override
  Widget build(BuildContext context) {
    final func = actions.onPitchBtnPressed(context, pitchKey, pitchEnabled);
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: pitchBtnSymmetricPadding),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: pitchBtnMaxWidth),
          child: AspectRatio(
            aspectRatio: pitchKey.contains('#') ? 1/3 : 1/4,
            child: ElevatedButton(
              onPressed: func != null ? () => func() : null,
              style: actions.stylePitchButton(context, pitchKey, pitchEnabled),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(pitchKey, textAlign: TextAlign.center),  
                )
              )
            )
          )
        )
      )
    );
  }
}