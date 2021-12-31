import 'package:cuckoo/constants.dart';
import 'package:cuckoo/screens/home/tabs/alarm/edit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeWidget extends ConsumerStatefulWidget {
  TimeWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends ConsumerState<TimeWidget> {
  final TextEditingController hours = TextEditingController();
  final TextEditingController minutes = TextEditingController();


  @override
  void initState() {
    super.initState();

    if (ref.read(alarmEditStateProvider).alarm!.time != '') {
      hours.text = ref.read(alarmEditStateProvider).alarm!.hours();
      minutes.text = ref.read(alarmEditStateProvider).alarm!.minutes();
    }

    hours.addListener(() {
      update();
    });

    minutes.addListener(() {
      update();
    });

  }

  void update() {
    ref.read(alarmEditStateProvider.notifier).time("${hours.value.text}:${minutes.value.text}");
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text('Time', style: theme.textTheme.headline5),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TimeField(controller: hours),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 12),
                child: Text(
                  ':',
                  style: TextStyle(color: PrimaryTextColor, fontSize: 32),
                ),
              ),
              TimeField(controller: minutes),
            ],
          ),
        ),
      ],
    );
  }
}

class TimeField extends StatelessWidget {
  TimeField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      alignment: Alignment.center,
      child: TextField(
        controller: controller,
        maxLength: 2,
        style: const TextStyle(color: PrimaryTextColor, fontSize: 32),
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          counter: Container(),
          contentPadding: const EdgeInsets.only(bottom: 5),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: PrimaryTextColor,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: PrimaryTextColor,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}
