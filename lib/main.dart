import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:js/js.dart';

void main() {
  debugPrint("Flutter Web App is starting...");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Building MyApp widget...");
    return const MaterialApp(
      home: VirtualBackgroundScreen(),
    );
  }
}

class VirtualBackgroundScreen extends StatelessWidget {
  const VirtualBackgroundScreen({super.key});

  // JavaScriptのchangeBackground関数を呼び出して背景を変更する
  void _changeBackground(String imagePath) {
    debugPrint("Changing background to: $imagePath");
    changeBackground(imagePath);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Building VirtualBackgroundScreen widget...");

    return Scaffold(
      appBar: AppBar(
        title: const Text('Virtual Background with Debug'),
      ),
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: HtmlElementView(viewType: 'outputCanvasContainer'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _changeBackground('assets/images/background1.jpg'),
                  child: const Text('Background 1'),
                ),
                ElevatedButton(
                  onPressed: () => _changeBackground('assets/images/background2.jpg'),
                  child: const Text('Background 2'),
                ),
                ElevatedButton(
                  onPressed: () => _changeBackground('assets/images/background3.jpg'),
                  child: const Text('Background 3'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// JavaScriptのchangeBackground関数をFlutterから呼び出せるように設定
@JS('changeBackground')
external void changeBackground(String imagePath);
