import 'package:audioplayers/audioplayers.dart';

class Player {
  final playerSingle = AudioPlayer();
  List<AudioPlayer> unisonPlayers = [];

  void playSingle(String pitch, String octave) async {
    await playerSingle.stop();
    pitch = pitch.replaceAll(RegExp(r'#'), 's');
    playerSingle.play(AssetSource('$pitch$octave.wav'));
  }

  void playUnison(List<String> notes) async {
    if (notes.isEmpty || notes.length!=2) {
      return;
    }
    if (unisonPlayers.length<notes.length) {
      setupUnisonPlayers(notes.length);
    } else {
      for (var player in unisonPlayers) {
        await player.stop();
      }
    }
    
    for (var i = 0; i < notes.length; i++) {
      notes[i] = notes[i].replaceAll(RegExp(r'#'), 's');
    }
    print(notes);

    for (var i = 0; i < notes.length; i++) {
      unisonPlayers[i].play(AssetSource('${notes[i]}.wav'));
    }
  }

  void setupUnisonPlayers(int numberOfNotes) {
    unisonPlayers.clear();
    for (var i = 0; i < numberOfNotes; i++) {
      unisonPlayers.add(AudioPlayer());
    }
  }
}