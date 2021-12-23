import 'package:cuckoo/constants.dart';
import 'package:flutter/material.dart';

class DayWidget extends StatelessWidget {
  const DayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Repeat', style: theme.textTheme.headline5),
          ),
          Day(title: 'Monday'),
          Day(title: 'Tuesday'),
          Day(title: 'Wednesday'),
          Day(title: 'Thursday'),
          Day(title: 'Friday'),
          Day(title: 'Saturday'),
          Day(title: 'Sunday'),
        ],
      ),
    );
  }
}

class Day extends StatelessWidget {
  const Day({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title),
          ),
          Spacer(),
          Icon(Icons.done, color: TextColor),
        ],
      ),
    );
  }
}
