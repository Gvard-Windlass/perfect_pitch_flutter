// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Settings _$SettingsFromJson(Map<String, dynamic> json) => Settings(
      pitchSelection: Map<String, bool>.from(json['pitch_selection'] as Map),
      octaveSelection: Map<String, bool>.from(json['octave_selection'] as Map),
      exerciseMode: $enumDecode(_$ExerciseModeEnumMap, json['exercise_mode']),
    );

Map<String, dynamic> _$SettingsToJson(Settings instance) => <String, dynamic>{
      'pitch_selection': instance.pitchSelection,
      'octave_selection': instance.octaveSelection,
      'exercise_mode': _$ExerciseModeEnumMap[instance.exerciseMode]!,
    };

const _$ExerciseModeEnumMap = {
  ExerciseMode.singlePitch: 'singlePitch',
  ExerciseMode.unison: 'unison',
};
