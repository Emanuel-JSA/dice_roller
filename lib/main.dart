import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: const Center(child: Text('Dice roll')),
          backgroundColor: Colors.amber[900],
        ),
        body: const DiceRoller(),
      ),
    );
  }
}

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: MaterialButton(
              onPressed: () {
                setState(() {
                  leftDiceNumber = rollDice();
                });
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: MaterialButton(
                onPressed: () {
                  setState(() {
                    rightDiceNumber = rollDice();
                  });
                },
                child: Image.asset('images/dice$rightDiceNumber.png')),
          ),
        ],
      ),
    );
  }
}

int rollDice() {
  return 1 + Random().nextInt(6 - 1);
}
