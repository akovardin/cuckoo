import 'package:cuckoo/components/buttons/primary.dart';
import 'package:flutter/material.dart';

class AudioWidget extends StatelessWidget {
  const AudioWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text('Audio', style: theme.textTheme.headline5),
          ),
          PrimaryButton(title: 'SELECT', tap: () {}),
          SizedBox(height: 24),
          Text('file name'),
        ],
      )
    );
  }
}
