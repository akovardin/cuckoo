import 'dart:async';

import 'package:cuckoo/services/alarms.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:audioplayers/audioplayers.dart';

var homeStateProvider = StateNotifierProvider<HomeStateNotifier, HomeState>((ref) {
  return HomeStateNotifier(HomeState(alarm: false));
});

class HomeState {
  bool alarm;

  HomeState({required this.alarm});
}

class HomeStateNotifier extends StateNotifier<HomeState> {
  final AlarmService alarms = AlarmService();
  final AudioPlayer player = AudioPlayer();

  HomeStateNotifier(HomeState state) : super(state);

  schedule() {
    // start loop
    Timer.periodic(Duration(seconds: 10), (timer) {
      return;
      alarms.fetch().then((aa) {
        for (var alarm in aa) {
          if (alarm.active()) {
            // @todo: file with whitespaces
            start(alarm.audio);
          }
        }
      });
    });
  }

  start(String audio) {
    player.play(audio, isLocal: true).then((result) {
      state = HomeState(alarm: true);
    });
  }

  stop() {
    state = HomeState(alarm: false);
    player.stop();
  }
}
