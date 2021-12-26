import 'package:cuckoo/models/alarm.dart';
import 'package:cuckoo/services/alarms.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'state.g.dart';

var alarmStateProvider = StateNotifierProvider<AlarmStateNotifier, AlarmState>((ref) {
  return AlarmStateNotifier(
    AlarmState(alarm: null),
    service: AlarmService(),
  );
});

@CopyWith()
class AlarmState {
  AlarmModel? alarm;

  AlarmState({
    required this.alarm,
  });
}

class AlarmStateNotifier extends StateNotifier<AlarmState> {
  final AlarmService service;

  AlarmStateNotifier(AlarmState state, {required this.service}) : super(state);

  current(AlarmModel alarm) {
    state = state.copyWith(alarm: alarm);
  }

  audio(String path) {
    state = state.copyWith(alarm: state.alarm?..audio = path);
  }

  time(String time) {
    state = state.copyWith(alarm: state.alarm?..time = time);
  }

  Future<void> update(AlarmModel alarm) async {
    await service.update(alarm);
  }

  Future<void> create(AlarmModel alarm) async {
    await service.create(alarm);
  }
}
