import 'package:flutter/material.dart';
import 'settings_storage.dart';
import 'settings_provider.dart';
import 'settings_model.dart';

class SettingsWrapper extends StatefulWidget {
  const SettingsWrapper({super.key, required this.child, required this.storage});
  final Widget child;
  final SettingsStorage storage;

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
class SettingsWrapperState extends State<SettingsWrapper> {
  bool isLoading = true;
  late Settings settings;

  Map<String, bool> get whiteKeys => {
    for (final key in settings.pitchSelection.keys)
      if (!key.contains('#')) key: settings.pitchSelection[key]!
  };

  Map<String, bool> get blackKeys => {
    for (final key in settings.pitchSelection.keys)
      if (key.contains('#')) key: settings.pitchSelection[key]!
  };

  List<String> get activePitches => [
    for (MapEntry pitchSetting in settings.pitchSelection.entries)
      if (pitchSetting.value) pitchSetting.key
  ];

  List<String> get activeOctaves => [
    for (MapEntry octaveSetting in settings.octaveSelection.entries)
      if (octaveSetting.value) octaveSetting.key
  ];

  void togglePitch(String key, bool value) {
    setState(() {
      settings.pitchSelection[key] = !value;
    });
    widget.storage.saveSettings(settings);
  }

  Future onModeSelection(ExerciseMode? mode) async {
    setState(() {
      settings.exerciseMode = mode!;
    });
    await widget.storage.saveSettings(settings);
  }

  Future onOctaveSelection(String octave, bool? newValue) async {
    setState(() {
      settings.octaveSelection[octave] = newValue!;
    });
    await widget.storage.saveSettings(settings);
  }

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future _loadSettings() async {
    settings = await widget.storage.loadSettings();
    setState(() {
      isLoading = false;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return SettingsProvider(data: this, child: widget.child);
  }
}