import 'package:cuckoo/models/alarm.dart';
import 'package:cuckoo/services/alarms.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'state.g.dart';

var alarmStateProvider = StateNotifierProvider<AlarmStateNotifier, AlarmState>((ref) {
  return AlarmStateNotifier(
    AlarmState(alarms: []),
    service: AlarmService(),
  );
});

@CopyWith()
class AlarmState {
  List<AlarmModel> alarms = [];

  AlarmState({
    required this.alarms,
  });
}

class AlarmStateNotifier extends StateNotifier<AlarmState> {
  final AlarmService service;

  AlarmStateNotifier(AlarmState state, {required this.service}) : super(state);

  fetch() {
    this.service.fetch().then((value) {
      state = state.copyWith(alarms: value);
    });
  }

  update(AlarmModel alarm) {
    this.service.update(alarm);
    fetch();
  }

  add(AlarmModel alarm) {
    this.service.add(alarm);
    fetch();
  }

  delete() {

  }
}
