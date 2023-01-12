import 'package:flutter/material.dart';
import 'package:perfect_pitch_flutter/widgets/mode_selection.dart';
import 'package:perfect_pitch_flutter/widgets/octave_selection.dart';
import 'package:perfect_pitch_flutter/widgets/pitch_buttons.dart';
import 'package:perfect_pitch_flutter/settings/settings_wrapper.dart';
import 'package:perfect_pitch_flutter/widgets/start_button.dart';

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
            children: [
              const PitchButtons(),
              const SizedBox(height: 12),
              const ModeSelection(),
              const SizedBox(height: 8),
              Text('Octaves', style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 12),
              const OctaveSelection(),
              const SizedBox(height: 8),
              Text('Begin', style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  StartButton(icon: Icons.headphones, route: '/drill')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}