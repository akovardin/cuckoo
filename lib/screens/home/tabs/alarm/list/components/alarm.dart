import 'package:cuckoo/constants.dart';
import 'package:cuckoo/models/alarm.dart';
import 'package:cuckoo/screens/home/tabs/alarm/edit/edit.dart';
import 'package:cuckoo/screens/home/tabs/alarm/edit/state.dart';
import 'package:cuckoo/screens/home/tabs/alarm/list/state.dart';
import 'package:flutter/cupertino.dart';
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
          if (ref.watch(listStateProvider).edit)
            Row(
              children: [
                GestureDetector(
                  child: Icon(CupertinoIcons.minus_circled, color: Colors.red),
                  onTap: () {
                    ref.read(listStateProvider.notifier).remove(alarm.id);
                  },
                ),
                SizedBox(width: 12),
              ],
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(alarm.time, style: style.copyWith(fontSize: 44, fontWeight: FontWeight.w300)),
              const SizedBox(height: 12),
              Text(alarm.audio != '' ? alarm.name() : 'Alarm', style: style),
            ],
          ),
          const Spacer(),
          if (ref.watch(listStateProvider).edit)
            GestureDetector(
              child: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onTap: () {
                ref.read(editStateProvider.notifier).current(alarm);

                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => AlarmEditScreen(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
            )
          else
            Switch.adaptive(
              activeColor: PrimaryColor,
              value: alarm.status,
              onChanged: (v) {
                ref.read(editStateProvider.notifier).update(alarm..status = !alarm.status).then((value) {
                  ref.read(listStateProvider.notifier).fetch();
                });
              },
            ),
        ],
      ),
    );
  }
}
