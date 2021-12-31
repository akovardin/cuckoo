import 'package:cuckoo/constants.dart';
import 'package:cuckoo/models/clock.dart';
import 'package:flutter/material.dart';

class ClockWidget extends StatelessWidget {
  const ClockWidget({
    Key? key,
    required this.clock,
  }) : super(key: key);

  final ClockModel clock;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 24),
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: GrayColor, width: 1))),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tuday, -3HRS', style: theme.textTheme.bodyText1?.copyWith(color: SecondaryTextColor)),
              SizedBox(height: 4),
              Text('Moscow', style: theme.textTheme.headline4?.copyWith(fontWeight: FontWeight.w300)),
            ],
          ),
          const Spacer(),
          Text('10:00', style: theme.textTheme.headline1?.copyWith(fontWeight: FontWeight.w300)),
        ],
      ),
    );
  }
}
