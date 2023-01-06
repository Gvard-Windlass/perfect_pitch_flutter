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
class SettingsWrapperState extends State<SettingsWrapper> {
  @override
  Widget build(BuildContext context) {
    return SettingsProvider(data: this, child: widget.child);
  }
}