import 'package:cuckoo/models/alarm.dart';
import 'package:cuckoo/services/alarms.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'state.g.dart';

var alarmEditStateProvider = StateNotifierProvider<AlarmEditStateNotifier, AlarmEditState>((ref) {
  return AlarmEditStateNotifier(
    AlarmEditState(alarm: null),
    service: AlarmService(),
  );
});

@CopyWith()
class AlarmEditState {
  AlarmModel? alarm;

  AlarmEditState({
    required this.alarm,
  });
}

class AlarmEditStateNotifier extends StateNotifier<AlarmEditState> {
  final AlarmService service;

  AlarmEditStateNotifier(AlarmEditState state, {required this.service}) : super(state);

  current(AlarmModel alarm) {
    state = state.copyWith(alarm: alarm);
  }

  audio(String path) {
    state = state.copyWith(alarm: state.alarm?..audio = path);
  }

  time(String time) {
    state = state.copyWith(alarm: state.alarm?..time = time);
  }

  Future<void> save(AlarmModel alarm) async {
    if (alarm.id == 0) {
      await service.create(alarm);
    } else {
      await service.update(alarm);
    }
  }

  Future<void> update(AlarmModel alarm) async {
    await service.update(alarm);
  }

  Future<void> create(AlarmModel alarm) async {
    await service.create(alarm);
  }

  // days switcher
  void monday() {
    state = state.copyWith(alarm: state.alarm?..monday = !(state.alarm?.monday ?? false));
  }

  void tuesday() {
    state = state.copyWith(alarm: state.alarm?..tuesday = !(state.alarm?.tuesday ?? false));
  }

  void wednesday() {
    state = state.copyWith(alarm: state.alarm?..wednesday = !(state.alarm?.wednesday ?? false));
  }

  void thursday() {
    state = state.copyWith(alarm: state.alarm?..thursday = !(state.alarm?.thursday ?? false));
  }

  void friday() {
    state = state.copyWith(alarm: state.alarm?..friday = !(state.alarm?.friday ?? false));
  }

  void saturday() {
    state = state.copyWith(alarm: state.alarm?..saturday = !(state.alarm?.saturday ?? false));
  }

  void sunday() {
    state = state.copyWith(alarm: state.alarm?..sunday = !(state.alarm?.sunday ?? false));
  }

}
