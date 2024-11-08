import 'package:flutter/material.dart';

void main() {
  debugPrint("Flutter Web App is starting...");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Building MyApp widget...");
    return const MaterialApp(home: VirtualBackgroundScreen());
  }
}

class VirtualBackgroundScreen extends StatelessWidget {
  const VirtualBackgroundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Building VirtualBackgroundScreen widget...");

    return Scaffold(
      appBar: AppBar(title: const Text('Virtual Background with Debug')),
      body: const Center(child: HtmlElementView(viewType: 'outputCanvasContainer')),
    );
  }
}
