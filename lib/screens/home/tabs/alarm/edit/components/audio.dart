import 'dart:io';

import 'package:cuckoo/components/buttons/primary.dart';
import 'package:cuckoo/screens/home/tabs/alarm/edit/state.dart';
import 'package:cuckoo/screens/home/tabs/alarm/list/state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AudioWidget extends ConsumerWidget {
  const AudioWidget({Key? key, this.selected}) : super(key: key);

  final Function? selected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text('Audio', style: theme.textTheme.headline5),
          ),
          PrimaryButton(
              title: 'SELECT',
              tap: () async {
                var result = await FilePicker.platform.pickFiles();

                if (result == null) {
                  return;
                }

                if (result.files.single.path == null) {
                  return;
                }

                File file = File(result.files.single.path!);

                ref.read(alarmStateProvider.notifier).audio(file.path);
              }),
          SizedBox(height: 24),
          Text(
            ref.watch(alarmStateProvider).alarm!.audio != ''
                ? ref.watch(alarmStateProvider).alarm!.name()
                : 'Audio file',
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
