import 'package:flutter/material.dart';

class LeaveCurrentStage extends StatelessWidget {
  const LeaveCurrentStage({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: const Text('Are you sure you want to exit?'),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          ElevatedButton(
            child: const Text('Yes, exit'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          )
        ]);
  }
}
