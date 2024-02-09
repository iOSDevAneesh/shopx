import 'package:flutter/material.dart';

class Badges extends StatelessWidget {
  final String value;

  const Badges({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14,
      width: 14,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          value,
          style: const TextStyle(color: Colors.white, fontSize: 10),
        ),
      ),
    );
  }
}
