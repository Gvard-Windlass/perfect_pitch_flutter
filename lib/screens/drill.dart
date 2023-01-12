import 'package:flutter/material.dart';
import 'package:perfect_pitch_flutter/settings/settings_wrapper.dart';

class Drill extends StatelessWidget {
  Drill({super.key});

  final Map<ShortcutActivator, void Function()> shortcuts = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text('Drill', style: TextStyle(color: Colors.white)),
      ),
      body: SettingsWrapper.of(context).isLoading? const Center(child: CircularProgressIndicator()) : 
      SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height*0.65, 
          padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
          child: CallbackShortcuts(
            bindings: shortcuts,
            child: Focus(
              autofocus: true,
              child: Column(
                children: [],
              ),
            ),
          ),
        ),
      ),
    );
  }
}