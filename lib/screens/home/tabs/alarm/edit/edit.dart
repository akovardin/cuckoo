import 'package:cuckoo/components/buttons/primary.dart';
import 'package:cuckoo/components/title/title.dart';
import 'package:cuckoo/models/alarm.dart';
import 'package:cuckoo/screens/home/tabs/alarm/edit/components/audio.dart';
import 'package:cuckoo/screens/home/tabs/alarm/edit/components/day.dart';
import 'package:cuckoo/screens/home/tabs/alarm/edit/components/time.dart';
import 'package:cuckoo/screens/home/tabs/alarm/state.dart';
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
                  Text('Create', style: theme.textTheme.headline3),
                  const Spacer(),
                    PrimaryButton(
                      title: 'SAVE',
                      tap: () {
                        ref.read(alarmStateProvider.notifier).create(AlarmModel(0, "${hours.value.text}:${minutes.value.text}", '', '', false));
                      },
                    )
                ],
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TimeWidget(
                        hours: hours,
                        minutes: minutes,
                      ),
                      SizedBox(height: 50),
                      AudioWidget(),
                    ],
                  ),
                  SizedBox(width: 200),
                  DayWidget(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
