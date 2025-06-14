import 'package:flutter/material.dart';
import 'widgets/dice_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Aplikasi Dadu'),
        ),
        body: Center(
          child: DiceWidget(),
        ),
      ),
    );
  }
}