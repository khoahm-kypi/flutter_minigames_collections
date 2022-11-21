import 'package:flutter/material.dart';

import 'src/dino_home_screen.dart';

class DinoGamePackage {
  static Future openDinoGame(BuildContext context2) async {
    return Navigator.of(context2)
        .push(MaterialPageRoute(builder: (context) => const DinoHomeScreen()));
  }
}
