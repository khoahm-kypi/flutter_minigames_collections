import 'package:flutter/material.dart';

class GameItem extends StatelessWidget {
  final String name;
  final VoidCallback onClicked;
  const GameItem({super.key, required this.name, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 200,
        height: 50,
        child: OutlinedButton(onPressed: onClicked, child: Text(name)),
      ),
    );
  }
}
