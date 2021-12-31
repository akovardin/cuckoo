import 'package:cuckoo/models/clock.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:cuckoo/services/clocks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'state.g.dart';

var clockListStateProvider = StateNotifierProvider<ClockListStateNotifier, ClockListState>((ref) {
  return ClockListStateNotifier(
    ClockListState(list: [], edit: false),
    service: ClocksService(),
  );
});

@CopyWith()
class ClockListState {
  bool edit;
  List<ClockModel> list;

  ClockListState({
    required this.edit,
    required this.list,
  });
}

class ClockListStateNotifier extends StateNotifier<ClockListState> {
  final ClocksService service;

  ClockListStateNotifier(ClockListState state, {required this.service}) : super(state);

  void mode() {
    state = state.copyWith(edit: !state.edit);
  }

  fetch() {
    service.fetch().then((value) {
      state = state.copyWith(list: value);
    });
  }
}
