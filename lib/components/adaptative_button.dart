import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  AdaptativeButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(label),
            onPressed: () => onPressed,
          )
        : ElevatedButton(
            onPressed: () => onPressed,
            style: ElevatedButton.styleFrom(
              primary: Colors.purple,
            ),
            child: Text(label),
          );
  }
}
