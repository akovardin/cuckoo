import 'package:cuckoo/models/alarm.dart';
import 'package:cuckoo/services/alarms.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'state.g.dart';

var alarmStateProvider = StateNotifierProvider<AlarmStateNotifier, AlarmState>((ref) {
  return AlarmStateNotifier(
    AlarmState(list: [], edit: false, alarm: null),
    service: AlarmService(),
  );
});

@CopyWith()
class AlarmState {
  List<AlarmModel> list = [];
  AlarmModel? alarm; // alarm for edit
  bool edit = false;

  AlarmState({
    required this.list,
    required this.edit,
    required this.alarm,
  });
}

class AlarmStateNotifier extends StateNotifier<AlarmState> {
  final AlarmService service;

  AlarmStateNotifier(AlarmState state, {required this.service}) : super(state);

  mode() {
    state = state.copyWith(edit: !state.edit);
  }

  edit(AlarmModel alarm) {
    state = state.copyWith(alarm: alarm);
  }

  fetch() {
    service.fetch().then((value) {
      state = state.copyWith(list: value);
    });
  }

  update(AlarmModel alarm) {
    service.update(alarm).then((value) {
      fetch();
    });
  }

  create(AlarmModel alarm) {
    service.create(alarm).then((value) {
      fetch();
    });
  }

  remove(int id) {
    service.remove(id).then((value) {
      fetch();
    });
  }
}
