import 'package:flutter/material.dart';

import 'game_page.dart';

class SnakeHomePage extends StatelessWidget {
  const SnakeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/snake_game.jpg',
              package: 'snake_game_package',
            ),
            const SizedBox(height: 50.0),
            const Text('Welcome to SnakeGameFlutter',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const GamePage()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
