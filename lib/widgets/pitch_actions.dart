import 'package:flutter/material.dart';
import 'package:perfect_pitch_flutter/exercise/exercise_wrapper.dart';
import 'package:perfect_pitch_flutter/settings/settings_wrapper.dart';

abstract class PitchActions {
  Function? onPitchBtnPressed(BuildContext context, String pitchKey, bool pitchEnabled);
  ButtonStyle stylePitchButton(BuildContext context, String pitchKey, bool pitchEnabled);

  Color? _getPitchButtonOverlayColor(Set<MaterialState> states, String pitchKey) {
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
}

class SettingsPitchActions extends PitchActions {
  @override
  Function? onPitchBtnPressed(BuildContext context, String pitchKey, bool pitchEnabled) {
    return () => SettingsWrapper.of(context).togglePitch(pitchKey, pitchEnabled);
  }

  @override
  ButtonStyle stylePitchButton(BuildContext context, String pitchKey, bool pitchEnabled) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(_getPitchButtonBackgroundColor(pitchKey, pitchEnabled)),
      foregroundColor: MaterialStateProperty.all<Color>(pitchKey.contains('#')?Colors.white:Colors.black),
      overlayColor: MaterialStateProperty.resolveWith((states) => _getPitchButtonOverlayColor(states, pitchKey))
    );
  }

  Color _getPitchButtonBackgroundColor(String pitchKey, bool pitchEnabled) {
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

class ExercisePitchActions extends PitchActions {
  @override
  Function? onPitchBtnPressed(BuildContext context, String pitchKey, bool pitchEnabled) {
    return pitchEnabled? () => ExerciseWrapper.of(context).onPitchClick(pitchKey) : null;
  }

  @override
  ButtonStyle stylePitchButton(BuildContext context, String pitchKey, bool pitchEnabled) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(ExerciseWrapper.of(context).buttonColors[pitchKey]!),
      foregroundColor: MaterialStateProperty.all<Color>(_getPitchButtonForegroundColor(pitchKey, pitchEnabled)),
      overlayColor: MaterialStateProperty.resolveWith((states) => _getPitchButtonOverlayColor(states, pitchKey))
    );
  }

  Color _getPitchButtonForegroundColor(String pitchKey, bool pitchEnabled) {
    if (pitchKey.contains('#')) {
      if (!pitchEnabled) {
        Colors.grey.shade400;
      }
      return Colors.white;
    } else {
      if (!pitchEnabled) {
        return Colors.grey.shade400;
      }
      return Colors.black;
    }
  }
}