library flappy_bird_package;

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/Layouts/Pages/page_start_screen.dart';

class FlappyBirdPackage {
  static Future openGame(BuildContext context2) async {
    NavigatorState navigator = Navigator.of(context2);

    try {
      await Hive.initFlutter();
      var box = await Hive.openBox('user');
    } catch (e) {}

    return navigator
        .push(MaterialPageRoute(builder: (context) => const StartScreen()));
  }
}
