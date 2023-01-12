import 'package:flutter/material.dart';
import 'package:perfect_pitch_flutter/settings/settings_model.dart';
import 'package:perfect_pitch_flutter/settings/settings_wrapper.dart';

class ModeSelection extends StatelessWidget {
  const ModeSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntrinsicWidth(child: RadioListTile<ExerciseMode>(
          title: const Text('single pitch'),
          value: ExerciseMode.singlePitch, 
          groupValue: SettingsWrapper.of(context).settings.exerciseMode, 
          onChanged: (value) => SettingsWrapper.of(context).onModeSelection(value),
        )),
        IntrinsicWidth(child: RadioListTile<ExerciseMode>(
          title: const Text('unison'),
          value: ExerciseMode.unison, 
          groupValue: SettingsWrapper.of(context).settings.exerciseMode, 
          onChanged: (value) => SettingsWrapper.of(context).onModeSelection(value),
        )),
      ],
    );
  }
}