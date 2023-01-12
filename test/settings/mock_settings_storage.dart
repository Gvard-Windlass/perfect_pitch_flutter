import 'package:perfect_pitch_flutter/settings/settings_model.dart';
import 'package:perfect_pitch_flutter/settings/settings_storage.dart';

class MockSettingsStorage extends SettingsStorage {
  @override
  Future<Settings> loadSettings() async {
    return Future.value(Settings.initial());
  }
  @override
  Future saveSettings(Settings settings) async {
    return Future.value();
  }
}