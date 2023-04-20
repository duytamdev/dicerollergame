import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body:  HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

int randomDice() {
  return 1 + Random().nextInt(6);
}

class _HomePageState extends State<HomePage> {
  Map<int, String> dice = {
    1: 'assets/images/dice-1.png',
    2: 'assets/images/dice-2.png',
    3: 'assets/images/dice-3.png',
    4: 'assets/images/dice-4.png',
    5: 'assets/images/dice-5.png',
    6: 'assets/images/dice-6.png',
  };
  int leftDice = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    leftDice = 1;
  }

  void changeDice() {
    setState(() {
      leftDice = randomDice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade900,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(padding: EdgeInsets.all(20),
          child: Text('Dice Roller', style: TextStyle(color: Colors.white, fontSize: 30),),
          ),
          Image(
              image: AssetImage(
                dice[leftDice]!,
              ),
              width: 200,
              height: 200),
          ElevatedButton(
            onPressed: changeDice,
            child: const Text('Roll Dice'),
          )
        ],
      )),
    );
  }
}
