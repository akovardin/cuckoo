import 'package:cuckoo/constants.dart';
import 'package:cuckoo/models/alarm.dart';
import 'package:cuckoo/screens/home/tabs/alarm/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlarmWidget extends ConsumerWidget {
  const AlarmWidget({
    Key? key,
    required this.alarm,
  }) : super(key: key);

  final AlarmModel alarm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const style = TextStyle(color: TextColor, fontSize: 14);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24),
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: GrayColor, width: 1))),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('12:00', style: style.copyWith(fontSize: 44, fontWeight: FontWeight.w300)),
              const SizedBox(height: 12),
              Text(alarm.audio, style: style),
            ],
          ),
          Spacer(),
          Switch.adaptive(
            value: alarm.status,
            onChanged: (v) {
              alarm.status = !alarm.status;
              ref.read(alarmStateProvider.notifier).update(alarm);
            },
          )
        ],
      ),
    );
  }
}
