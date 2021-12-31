import 'package:cuckoo/models/alarm.dart';
import 'package:cuckoo/services/alarms.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'state.g.dart';

var alarmListStateProvider = StateNotifierProvider<AlarmListStateNotifier, AlarmListState>((ref) {
  return AlarmListStateNotifier(
    AlarmListState(list: [], edit: false),
    service: AlarmService(),
  );
});

@CopyWith()
class AlarmListState {
  List<AlarmModel> list = [];
  bool edit = false;

  AlarmListState({
    required this.list,
    required this.edit,
  });
}

class AlarmListStateNotifier extends StateNotifier<AlarmListState> {
  final AlarmService service;

  AlarmListStateNotifier(AlarmListState state, {required this.service}) : super(state);

  mode() {
    state = state.copyWith(edit: !state.edit);
  }

  fetch() {
    service.fetch().then((value) {
      state = state.copyWith(list: value);
    });
  }

  remove(int id) {
    service.remove(id).then((value) {
      fetch();
    });
  }
}
