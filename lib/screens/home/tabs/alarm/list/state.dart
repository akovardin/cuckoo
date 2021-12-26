import 'package:cuckoo/models/alarm.dart';
import 'package:cuckoo/services/alarms.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'state.g.dart';

var listStateProvider = StateNotifierProvider<ListStateNotifier, ListState>((ref) {
  return ListStateNotifier(
    ListState(list: [], edit: false),
    service: AlarmService(),
  );
});

@CopyWith()
class ListState {
  List<AlarmModel> list = [];
  bool edit = false;

  ListState({
    required this.list,
    required this.edit,
  });
}

class ListStateNotifier extends StateNotifier<ListState> {
  final AlarmService service;

  ListStateNotifier(ListState state, {required this.service}) : super(state);

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
