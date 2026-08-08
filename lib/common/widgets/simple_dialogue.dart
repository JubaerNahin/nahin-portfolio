import 'package:flutter/material.dart';

void showSimpleDialog({
  required BuildContext context,
  required String title,
  required String message,
}) {
  showDialog(
    context: context,
    barrierDismissible: false, // user must tap button
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}
