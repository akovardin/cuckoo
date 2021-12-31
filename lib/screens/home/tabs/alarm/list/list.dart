import 'package:cuckoo/components/buttons/primary.dart';
import 'package:cuckoo/components/title/title.dart';
import 'package:cuckoo/constants.dart';
import 'package:cuckoo/models/alarm.dart';
import 'package:cuckoo/screens/home/tabs/alarm/edit/edit.dart';
import 'package:cuckoo/screens/home/tabs/alarm/edit/state.dart';
import 'package:cuckoo/screens/home/tabs/alarm/list/components/alarm.dart';
import 'package:cuckoo/screens/home/tabs/alarm/list/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlarmListScreen extends ConsumerStatefulWidget {
  const AlarmListScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AlarmListScreen> createState() => _AlarmListScreenState();
}

class _AlarmListScreenState extends ConsumerState<AlarmListScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(alarmListStateProvider.notifier).fetch();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        TitleWidget(
          child: Row(
            children: [
              const Spacer(),
              GestureDetector(
                child: const Icon(Icons.add, color: Colors.grey),
                onTap: () {
                  ref
                      .read(alarmEditStateProvider.notifier)
                      .current(AlarmModel(0, '', '', '', false, false, false, false, false, false, false, false));
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => AlarmEditScreen(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
              ),
              const SizedBox(width: 24),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 36, top: 20, right: 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Alarm', style: theme.textTheme.headline2?.copyWith(fontWeight: FontWeight.bold)),
                      const Spacer(),
                      if (ref.watch(alarmListStateProvider).list.length > 0)
                        PrimaryButton(
                          title: ref.watch(alarmListStateProvider).edit ? 'CANCEL' : 'EDIT',
                          tap: () {
                            ref.read(alarmListStateProvider.notifier).mode();
                          },
                        )
                    ],
                  ),
                  const SizedBox(height: 32),
                  if (ref.watch(alarmListStateProvider).list.length > 0)
                    Column(
                      children: [
                        for (var alarm in ref.watch(alarmListStateProvider).list) AlarmWidget(alarm: alarm),
                      ],
                    )
                  else
                    Text('No one alarm', style: TextStyle(color: PrimaryTextColor, fontSize: 14)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
