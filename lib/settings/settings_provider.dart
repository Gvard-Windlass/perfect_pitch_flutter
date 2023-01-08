import 'package:flutter/material.dart';
import 'settings_wrapper.dart';

class SettingsProvider extends InheritedWidget {
  const SettingsProvider({super.key, required super.child, required this.data});
  final SettingsWrapperState data;

  @override
  bool updateShouldNotify(SettingsProvider oldWidget) => oldWidget != this;
}