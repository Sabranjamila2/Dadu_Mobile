import 'package:flutter/material.dart';
import 'dart:math';

class DiceWidget extends StatefulWidget {
  @override
  _DiceWidgetState createState() => _DiceWidgetState();
}

class _DiceWidgetState extends State<DiceWidget> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  int total = 2;
  int rollCount = 0;

  void _rollDices() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
      total = leftDiceNumber + rightDiceNumber;
      rollCount++;
    });
  }

  void _resetDices() {
    setState(() {
      leftDiceNumber = 1;
      rightDiceNumber = 1;
      total = 2;
      rollCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black, // Ganti jadi hitam
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total: $total',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Teks putih
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Jumlah lemparan: $rollCount',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white70, // Abu-abu terang
                ),
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: GestureDetector(
                      onTap: _rollDices,
                      child: Image.asset(
                        'assets/images/dice$leftDiceNumber.png',
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Flexible(
                    child: GestureDetector(
                      onTap: _rollDices,
                      child: Image.asset(
                        'assets/images/dice$rightDiceNumber.png',
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white24,
                  foregroundColor: Colors.white,
                ),
                onPressed: _resetDices,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text(
                    'Reset',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}