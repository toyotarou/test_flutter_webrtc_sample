import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web with JavaScript',
      home: Scaffold(
        appBar: AppBar(title: const Text('Virtual Background Example')),
        body: const Center(child: Text('JavaScriptで機能を制御しています。')),
      ),
    );
  }
}
