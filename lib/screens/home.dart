import 'package:flutter/material.dart';
import 'package:perfect_pitch_flutter/widgets/pitch_buttons.dart';
import 'package:perfect_pitch_flutter/settings/settings_wrapper.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(color: Colors.white)),
      ),
      body: SettingsWrapper.of(context).isLoading? const Center(child: CircularProgressIndicator()) : 
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
          child: Column(
            children: const [
              PitchButtons(),
            ],
          ),
        ),
      ),
    );
  }
}