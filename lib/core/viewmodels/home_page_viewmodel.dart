import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_music_player/core/viewmodels/base_model.dart';

class HomePageViewModel extends BaseModel {


  bool _isPlaying = false;
  Duration _duration = Duration();
  Duration _position = Duration();


  Duration get duration => _duration;

  setDuration(Duration value) {
    _duration = value;
    notifyListeners();
  }

  bool get isPlaying => _isPlaying;

  setIsPlaying(bool value) {
    _isPlaying = value;
    notifyListeners();
  }

  void seekToSecond(int second,AudioPlayer advancedPlayer) {
    Duration newDuration = Duration(seconds: second);
    advancedPlayer.seek(newDuration);
  }

  Duration get position => _position;

  setPosition(Duration value) {
    _position = value;
    notifyListeners();
  }
}