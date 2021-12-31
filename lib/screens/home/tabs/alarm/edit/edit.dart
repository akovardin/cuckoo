import 'dart:io';

import 'package:cuckoo/components/buttons/primary.dart';
import 'package:cuckoo/components/title/title.dart';
import 'package:cuckoo/screens/home/tabs/alarm/edit/components/audio.dart';
import 'package:cuckoo/screens/home/tabs/alarm/edit/components/days.dart';
import 'package:cuckoo/screens/home/tabs/alarm/edit/components/time.dart';
import 'package:cuckoo/screens/home/tabs/alarm/edit/state.dart';
import 'package:cuckoo/screens/home/tabs/alarm/list/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlarmEditScreen extends ConsumerStatefulWidget {
  const AlarmEditScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AlarmEditScreen> createState() => _AlarmEditScreenState();
}

class _AlarmEditScreenState extends ConsumerState<AlarmEditScreen> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController hours = TextEditingController();
  TextEditingController minutes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        TitleWidget(
          child: Row(
            children: [
              const SizedBox(width: 24),
              GestureDetector(
                child: const Icon(Icons.arrow_back_ios_outlined, color: Colors.grey),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 36, top: 20, right: 36),
          child: Column(
            children: [
              Row(
                children: [
                  Text(ref.read(alarmEditStateProvider).alarm!.id == 0 ? 'Create' : 'Update', style: theme.textTheme.headline2),
                  const Spacer(),
                  PrimaryButton(
                    title: 'SAVE',
                    tap: () {
                      ref.read(alarmEditStateProvider.notifier).save(ref.read(alarmEditStateProvider).alarm!).then((value) {
                        ref.read(alarmListStateProvider.notifier).fetch();
                        Navigator.pop(context);
                      });
                    },
                  )
                ],
              ),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TimeWidget(),
                      SizedBox(height: 50),
                      AudioWidget(),
                    ],
                  ),
                  SizedBox(width: 150),
                  DaysWidget(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
