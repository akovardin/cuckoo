import 'package:flutter/material.dart';

class Stopwatch extends StatelessWidget {
  const Stopwatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Stopwatch in progress", style: TextStyle(color: Colors.white)),
    );
  }
}
