import 'package:flutter/material.dart';
import 'pitch_button.dart';

class PitchButtons extends StatelessWidget {
  const PitchButtons({super.key});
  static final whiteKeys = ['C', 'D', 'E', 'F', 'G', 'A', 'B'];
  static final blackKeys = ['C#', 'D#', 'F#', 'G#', 'A#'];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: whiteKeys.map((e) => PitchButton(
            pitchKey: e, 
            pitchEnabled: false
          )).toList()
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: ConstrainedBox(constraints: 
                const BoxConstraints(maxWidth: 70))
            ),
            ...blackKeys.sublist(0, 2).map((e) {
              return PitchButton(pitchKey: e, pitchEnabled: false);
            }).toList(),
            Flexible(
              child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 70), 
                child: const AspectRatio(aspectRatio: 1/3)
            ))),
            ...blackKeys.sublist(2).map((e) {
              return PitchButton(pitchKey: e, pitchEnabled: false);
            }).toList(),
          ]
        )
      ],
    );
  }
}