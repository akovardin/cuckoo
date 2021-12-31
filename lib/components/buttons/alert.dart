import 'package:cuckoo/constants.dart';
import 'package:flutter/material.dart';

class AlertButton extends StatelessWidget {
  const AlertButton({
    Key? key,
    required this.title,
    required this.tap,
  }) : super(key: key);

  final String title;
  final GestureTapCallback? tap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 64, vertical: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: PrimaryColor,
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onTap: tap,
    );
  }
}
