import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'settings_model.dart';

class SettingsStorage {
  static Future<Settings> loadSettings() async {
    String settingsPath = await _getFilePath();
    File settingsFile = File(settingsPath);

    if (!await settingsFile.exists()) {
      await setDefaultSettings();
      settingsFile = File(settingsPath);
    }

    Settings settings = Settings.fromJson(jsonDecode(settingsFile.readAsStringSync()));
    return settings;
  }

  static Future saveSettings(Settings settings) async {
    String settingsPath = await _getFilePath();
    File settingsFile = File(settingsPath);
    settingsFile.writeAsStringSync(jsonEncode(settings.toJson()));
  }

  static Future setDefaultSettings() async {
    String settingsPath = await _getFilePath();

    Settings defaultSettings = Settings.initial();
    File settingsFile = await File(settingsPath).create(recursive: true);
    settingsFile.writeAsStringSync(jsonEncode(defaultSettings.toJson()));
  }

  static Future<String> _getFilePath() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    String folder = 'perfect pitch flutter';
    String settingsPath = p.join(appDocPath, folder, 'settings.json');
    return settingsPath;
  }
}