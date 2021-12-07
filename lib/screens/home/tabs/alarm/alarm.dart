import 'package:cuckoo/constants.dart';
import 'package:cuckoo/screens/home/tabs/alarm/components/alarm.dart';
import 'package:cuckoo/screens/home/tabs/alarm/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlarmScreen extends ConsumerStatefulWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends ConsumerState<AlarmScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(alarmStateProvider.notifier).fetch();
  }

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(color: TextColor, fontSize: 14);

    return Padding(
      padding: const EdgeInsets.only(left: 36, top: 20, right: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Alarm', style: style.copyWith(fontSize: 38, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          Column(
            children: [
              for (var alarm in ref.watch(alarmStateProvider).alarms) AlarmWidget(alarm: alarm),
            ],
          )
        ],
      ),
    );
  }
}
