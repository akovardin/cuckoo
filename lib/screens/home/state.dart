import 'package:flutter_riverpod/flutter_riverpod.dart';

var homeStateProvider = StateNotifierProvider<HomeStateNotifier, HomeState>((ref) {
  return HomeStateNotifier(HomeState(isAlarmButton: true));
});


class HomeState {
  bool isAlarmButton;

  HomeState({required this.isAlarmButton});
}

class HomeStateNotifier extends StateNotifier<HomeState> {
  HomeStateNotifier(HomeState state) : super(state);
  
  showAlarmButton() {
    state = HomeState(isAlarmButton: true);
  }

  hideAlarmButton() {
    state = HomeState(isAlarmButton: false);
  }
}
