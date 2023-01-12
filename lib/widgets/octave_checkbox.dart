import 'package:flutter/material.dart';
import 'package:perfect_pitch_flutter/settings/settings_wrapper.dart';

class OctaveCheckbox extends StatelessWidget {
  const OctaveCheckbox({super.key, required this.octave, required this.value});
  final String octave;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: CheckboxListTile(
        title: Text(octave),
        value: value, 
        onChanged: (newValue) => SettingsWrapper.of(context).onOctaveSelection(octave, newValue)
      )
    );
  }
}