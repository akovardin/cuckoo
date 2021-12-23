import 'package:cuckoo/constants.dart';
import 'package:flutter/material.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({
    Key? key,
    required this.hours,
    required this.minutes,
  }) : super(key: key);

  final TextEditingController hours;
  final TextEditingController minutes;

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
                  style: TextStyle(color: TextColor, fontSize: 32),
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
        style: const TextStyle(color: TextColor, fontSize: 32),
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          counter: Container(),
          contentPadding: const EdgeInsets.only(bottom: 5),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: TextColor,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: TextColor,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}
