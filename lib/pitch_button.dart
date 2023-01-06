import 'package:flutter/material.dart';
import 'settings_wrapper.dart';

class PitchButton extends StatelessWidget {
  const PitchButton({super.key, required this.pitchKey, required this.pitchEnabled});
  final String pitchKey;
  final bool pitchEnabled;
  static const double pitchBtnMaxWidth = 70;
  static const double pitchBtnSymmetricPadding = 4;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: pitchBtnSymmetricPadding),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: pitchBtnMaxWidth),
          child: AspectRatio(
            aspectRatio: pitchKey.contains('#') ? 1/3 : 1/4,
            child: ElevatedButton(
              onPressed: () => SettingsWrapper.of(context).togglePitch(pitchKey, pitchEnabled),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(_getPitchButtonColor()),
                foregroundColor: MaterialStateProperty.all<Color>(pitchKey.contains('#')?Colors.white:Colors.black),
                overlayColor: MaterialStateProperty.resolveWith(_getPitchButtonOverlayColor)
              ),
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

  Color? _getPitchButtonOverlayColor(Set<MaterialState> states) {
    Color overlayColor = pitchKey.contains('#')?Colors.grey.shade200:Colors.black;
    if (states.contains(MaterialState.hovered)) {
        return overlayColor.withOpacity(0.08);
      }
      if (states.contains(MaterialState.focused)) {
        return overlayColor.withOpacity(0.12);
      }
      if (states.contains(MaterialState.pressed)) {
        return overlayColor.withOpacity(0.12);
      }
    return null;
  }

  Color _getPitchButtonColor() {
    if (pitchKey.contains('#')) {
      if (pitchEnabled) {
        return Colors.lightGreen.shade900;
      }
      return const Color.fromARGB(255, 35, 35, 35);
    } else {
      if (pitchEnabled) {
        return Colors.lightGreen;
      }
      return Colors.white;
    }
  }
}