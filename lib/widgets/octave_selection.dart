import 'package:flutter/material.dart';
import 'package:perfect_pitch_flutter/settings/settings_wrapper.dart';
import 'package:perfect_pitch_flutter/widgets/octave_checkbox.dart';

class OctaveSelection extends StatelessWidget {
  const OctaveSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        for (MapEntry e in SettingsWrapper.of(context).settings.octaveSelection.entries)
          OctaveCheckbox(octave: e.key, value: e.value)
      ],
    );
  }
}