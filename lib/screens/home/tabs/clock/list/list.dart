import 'package:cuckoo/components/buttons/primary.dart';
import 'package:cuckoo/components/title/title.dart';
import 'package:cuckoo/screens/home/tabs/clock/list/components/clock.dart';
import 'package:cuckoo/screens/home/tabs/clock/list/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClockListScreen extends ConsumerStatefulWidget {
  const ClockListScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ClockListScreen> createState() => _ClockListScreenState();
}

class _ClockListScreenState extends ConsumerState<ClockListScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(clockListStateProvider.notifier).fetch();
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
                onTap: () {},
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
                      Text('World Clock', style: theme.textTheme.headline2?.copyWith(fontWeight: FontWeight.bold)),
                      const Spacer(),
                      if (ref.watch(clockListStateProvider).list.length > 0)
                        PrimaryButton(
                          title: ref.watch(clockListStateProvider).edit ? 'CANCEL' : 'EDIT',
                          tap: () {
                            ref.read(clockListStateProvider.notifier).mode();
                          },
                        )
                    ],
                  ),
                  const SizedBox(height: 32),
                  for (var clock in ref.watch(clockListStateProvider).list) ClockWidget(clock: clock),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

