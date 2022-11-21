import 'package:flutter/material.dart';
import 'package:snake_game_package/home_page.dart';

class SnakeGamePackage {
  static Future openSnakeGame(BuildContext context2) async {
    return Navigator.of(context2)
        .push(MaterialPageRoute(builder: (context) => const SnakeHomePage()));
  }
}
