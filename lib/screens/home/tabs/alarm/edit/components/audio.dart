import 'dart:io';

import 'package:cuckoo/components/buttons/primary.dart';
import 'package:cuckoo/screens/home/tabs/alarm/edit/state.dart';
import 'package:cuckoo/screens/home/tabs/alarm/list/state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

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

                // copy to local folder

                Directory dir = await getApplicationDocumentsDirectory();
                String path = dir.path;

                File src = File(result.files.single.path!);
                var dst = join(path, basename(src.path));
                src.copy(dst);

                print(dst);

                ref.read(editStateProvider.notifier).audio(dst);
              }),
          SizedBox(height: 24),
          Container(
            width: 150,
            child: Text(
              ref.watch(editStateProvider).alarm!.audio != ''
                  ? ref.watch(editStateProvider).alarm!.name()
                  : 'Audio file',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
