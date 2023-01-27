import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:perfect_pitch_flutter/exercise/exercise_wrapper.dart';
import 'package:perfect_pitch_flutter/settings/settings_model.dart';
import 'package:perfect_pitch_flutter/settings/settings_wrapper.dart';
import 'package:perfect_pitch_flutter/widgets/chord_input_text.dart';
import 'package:perfect_pitch_flutter/widgets/drill_action_button.dart';
import 'package:perfect_pitch_flutter/widgets/pitch_buttons.dart';

class Drill extends StatelessWidget {
  const Drill({super.key});

  Map<ShortcutActivator, void Function()> getShortcuts(BuildContext context) {
    var shortcuts = {
      // qwerty
      const SingleActivator(LogicalKeyboardKey.keyR): ExerciseWrapper.of(context).repeat,
      const SingleActivator(LogicalKeyboardKey.keyP): ExerciseWrapper.of(context).repeat,
      // dvorak
      const SingleActivator(LogicalKeyboardKey.keyN): ExerciseWrapper.of(context).nextDrill,
      const SingleActivator(LogicalKeyboardKey.keyB): ExerciseWrapper.of(context).nextDrill,
    };
    if (SettingsWrapper.of(context).settings.exerciseMode == ExerciseMode.unison) {
      shortcuts.addAll({
        const SingleActivator(LogicalKeyboardKey.space): ExerciseWrapper.of(context).checkAnswerUnison,
        const SingleActivator(LogicalKeyboardKey.backspace): ExerciseWrapper.of(context).resetAnswer,
      });
    }
    return shortcuts;
  }

  @override
  Widget build(BuildContext context) {
    var shortcuts = getShortcuts(context);
    const tooltipDuration = Duration(milliseconds: 700);
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
                      Tooltip(
                        message: 'R',
                        waitDuration: tooltipDuration,
                        child: DrillActionButton(action: ExerciseWrapper.of(context).repeat, text: 'Repeat'),
                      ),
                      if(SettingsWrapper.of(context).settings.exerciseMode == 
                      ExerciseMode.unison)
                        ...[
                          const SizedBox(width: 36),
                          Tooltip(
                            message: 'Backspace',
                            waitDuration: tooltipDuration,
                            child: DrillActionButton(
                              action: ExerciseWrapper.of(context).resetAnswer, 
                              text: 'Reset', 
                              bgColor: Colors.redAccent.shade100
                            ),
                          ),
                          const SizedBox(width: 36),
                          Tooltip(
                            message: 'Space',
                            waitDuration: tooltipDuration,
                            child: DrillActionButton(
                              action: ExerciseWrapper.of(context).checkAnswerUnison, 
                              text: 'Check', 
                              bgColor: Colors.lightBlue.shade200
                            ),
                          )
                        ]
                    ],
                  ),
                  Tooltip(
                    message: 'N',
                    waitDuration: tooltipDuration,
                    child: DrillActionButton(action: ExerciseWrapper.of(context).nextDrill, text: 'Next'),
                  ),
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