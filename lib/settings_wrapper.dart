import 'package:flutter/material.dart';
import 'settings_provider.dart';

class SettingsWrapper extends StatefulWidget {
  const SettingsWrapper({super.key, required this.child});
  final Widget child;

  static SettingsWrapperState? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SettingsProvider>()?.data;
  }

  static SettingsWrapperState of(BuildContext context) {
    final SettingsWrapperState? result = maybeOf(context);
    assert(result != null, 'No settings widget found in context');
    return result!;
  }

  @override
  State<SettingsWrapper> createState() => SettingsWrapperState();
}

// data and methods go here
enum ExerciseMode {singlePitch, unison}

class SettingsWrapperState extends State<SettingsWrapper> {
  static final List<String> _pitches = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'];
  static final List<String> _octaves = ['1', '2', '3', '4', '5', '6', '7'];
  
  late Map<String, bool> pitchSelection;
  late Map<String, bool> octaveSelection;
  late ExerciseMode exerciseMode;

  Map<String, bool> get whiteKeys => {
    for (final key in pitchSelection.keys)
      if (!key.contains('#')) key: pitchSelection[key]!
  };

  Map<String, bool> get blackKeys => {
    for (final key in pitchSelection.keys)
      if (key.contains('#')) key: pitchSelection[key]!
  };

  @override
  void initState() {
    super.initState();
    final defaultPitches = ['E', 'F#'];
    final defaultOctaves = ['1', '2', '4', '5'];

    pitchSelection = Map.fromIterable(_pitches, value: (pitch) => defaultPitches.contains(pitch));
    octaveSelection = Map.fromIterable(_octaves, value: (octave) => defaultOctaves.contains(octave));
    exerciseMode = ExerciseMode.singlePitch;
  }
  
  @override
  Widget build(BuildContext context) {
    return SettingsProvider(data: this, child: widget.child);
  }
}