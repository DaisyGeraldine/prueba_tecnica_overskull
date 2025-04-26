import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  final Color color;

  const CustomContainer(
      {super.key, required this.text, this.color = Colors.purple});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: color,
          width: 1,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
