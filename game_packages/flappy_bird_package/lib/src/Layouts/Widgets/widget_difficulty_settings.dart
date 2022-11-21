// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import '../../Database/database.dart';
import '../../Global/constant.dart';
import '../../Global/functions.dart';

class DifficultySettings extends StatelessWidget {
  const DifficultySettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.026),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: myText("Difficulty", Colors.black, 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              gameButton(() {
                barrierMovement = 0.05;
                write("level", barrierMovement);
              }, "Easy", Colors.green.shade300),
              gameButton(() {
                barrierMovement = 0.08;
                write("level", barrierMovement);
              }, "Medium", Colors.yellow.shade700),
              gameButton(() {
                barrierMovement = 0.1;
                write("level", barrierMovement);
              }, "Hard", Colors.red.shade300),
            ],
          ),
        ],
      ),
    );
  }
}
