import 'package:flutter/material.dart';
import 'package:perfect_pitch_flutter/exercise/exercise_wrapper.dart';
import 'package:perfect_pitch_flutter/settings/settings_model.dart';
import 'package:perfect_pitch_flutter/settings/settings_wrapper.dart';
import 'package:perfect_pitch_flutter/widgets/chord_input_text.dart';
import 'package:perfect_pitch_flutter/widgets/drill_action_button.dart';
import 'package:perfect_pitch_flutter/widgets/pitch_buttons.dart';

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const PitchButtons(actionSet: PitchActionSet.drillActions),
                  if(SettingsWrapper.of(context).settings.exerciseMode == 
                  ExerciseMode.unison)
                    const ChordInputText(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DrillActionButton(action: () {}, text: 'Repeat'),
                      if(SettingsWrapper.of(context).settings.exerciseMode == 
                      ExerciseMode.unison)
                        ...[
                          const SizedBox(width: 36),
                          DrillActionButton(
                            action: ExerciseWrapper.of(context).resetAnswer, 
                            text: 'Reset', 
                            bgColor: Colors.redAccent.shade100
                          ),
                          const SizedBox(width: 36),
                          DrillActionButton(
                            action: ExerciseWrapper.of(context).checkAnswerUnison, 
                            text: 'Check', 
                            bgColor: Colors.lightBlue.shade200
                          ),
                        ]
                    ],
                  ),
                  DrillActionButton(action: ExerciseWrapper.of(context).nextDrill, text: 'Next'),
                  Text('${ExerciseWrapper.of(context).correctAnswers}/${ExerciseWrapper.of(context).drillCount}', 
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}