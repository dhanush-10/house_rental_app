import 'package:flutter/material.dart';

class Squaretile extends StatelessWidget {
  final String imagepath;
  const Squaretile({super.key, required this.imagepath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFE3FEF7),
      ),
      child: Image.asset(
        imagepath,
        height: 52,
        width: 52,
      ),
    );
  }
}
