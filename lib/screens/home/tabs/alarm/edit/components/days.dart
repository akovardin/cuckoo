import 'package:cuckoo/constants.dart';
import 'package:cuckoo/screens/home/tabs/alarm/edit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DaysWidget extends ConsumerWidget {
  const DaysWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          Day(
            title: 'Monday',
            checked: ref.watch(editStateProvider).alarm?.monday ?? false,
            tap:  () => ref.read(editStateProvider.notifier).monday(),
          ),
          Day(
            title: 'Tuesday',
            checked: ref.watch(editStateProvider).alarm?.tuesday ?? false,
            tap: () => ref.read(editStateProvider.notifier).tuesday(),
          ),
          Day(
            title: 'Wednesday',
            checked: ref.watch(editStateProvider).alarm?.wednesday ?? false,
            tap: () => ref.read(editStateProvider.notifier).wednesday(),
          ),
          Day(
            title: 'Thursday',
            checked: ref.watch(editStateProvider).alarm?.thursday ?? false,
            tap: () => ref.read(editStateProvider.notifier).thursday(),
          ),
          Day(
            title: 'Friday',
            checked: ref.watch(editStateProvider).alarm?.friday ?? false,
            tap: () => ref.read(editStateProvider.notifier).friday(),
          ),
          Day(
            title: 'Saturday',
            checked: ref.watch(editStateProvider).alarm?.saturday ?? false,
            tap: () => ref.read(editStateProvider.notifier).saturday()
          ),
          Day(
            title: 'Sunday',
            checked: ref.watch(editStateProvider).alarm?.sunday ?? false,
            tap: () => ref.read(editStateProvider.notifier).sunday()
          ),
        ],
      ),
    );
  }
}

class Day extends StatelessWidget {
  const Day({
    Key? key,
    required this.title,
    required this.checked,
    required this.tap,
  }) : super(key: key);

  final bool checked;
  final String title;
  final void Function() tap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title),
          ),
          Spacer(),
          if (checked) Icon(Icons.done, color: TextColor),
        ],
      ),
    );
  }
}
