import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:cuckoo/models/alarm.dart';
import 'package:cuckoo/services/alarms.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:audioplayers/audioplayers.dart';

var homeStateProvider = StateNotifierProvider<HomeStateNotifier, HomeState>((ref) {
  return HomeStateNotifier(HomeState(onair: true, alarm: AlarmModel(1, '12:11', 'exqmple.mp3', '', true, true, true, true, true, true, true, true)));
});

class HomeState {
  AlarmModel? alarm;
  bool onair;

  HomeState({
    this.alarm,
    required this.onair,
  });
}

class HomeStateNotifier extends StateNotifier<HomeState> {
  final AlarmService alarms = AlarmService();
  final AudioPlayer player = AudioPlayer();

  HomeStateNotifier(HomeState state) : super(state);

  schedule() {
    // start loop
    Timer.periodic(Duration(minutes: 1), (timer) {
      alarms.fetch().then((aa) {
        for (var alarm in aa) {
          if (alarm.active() && !state.onair) {
            start(alarm);
          }
        }
      });
    });
  }

  start(AlarmModel alarm) {
    player.play(alarm.audio, isLocal: true).then((result) {
      state = HomeState(alarm: alarm, onair: true);
    });
  }

  stop() {
    player.stop().then((value) {
      state = HomeState(alarm: null, onair: false);
    });
  }
}
