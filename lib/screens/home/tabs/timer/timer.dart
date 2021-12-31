import 'package:flutter/material.dart';

class Timer extends StatelessWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Timer in progress", style: TextStyle(color: Colors.white)),
    );
  }
}
