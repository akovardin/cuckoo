
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:cuckoo/constants.dart';
import 'package:cuckoo/models/alarm.dart';
import 'package:cuckoo/screens/home/tabs/alarm/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TitleWidget extends ConsumerWidget {
  TitleWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 55,
      decoration: const BoxDecoration(
        color: DarkColor,
        border: Border(
          left: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
      ),
      child: WindowTitleBarBox(
        child: MoveWindow(
          child: Container(
            decoration: const BoxDecoration(
              color: DarkColor,
              border: Border(
                bottom: BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              ),
            ),
            child: child
          ),
        ),
      ),
    );
  }
}
