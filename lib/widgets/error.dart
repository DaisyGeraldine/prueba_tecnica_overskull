
import 'package:flutter/material.dart';

class ErrorAlert extends StatelessWidget {
  final String message;
  const ErrorAlert({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Error'),
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.deepPurple,
      ),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Aceptar'),
        ),
      ],
    );
  }
}
