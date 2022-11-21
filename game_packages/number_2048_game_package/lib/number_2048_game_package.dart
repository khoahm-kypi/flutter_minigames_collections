import 'package:flutter/material.dart';
import 'package:number_2048_game_package/ui/main_menu/main_menu.dart';

class Number2048GamePackage {
  static Future openGame(BuildContext context2) async {
    return Navigator.of(context2)
        .push(MaterialPageRoute(builder: (context) => const MainMenu()));
  }
}
