import 'dart:html' as html;
import 'package:flutter/foundation.dart'; // kIsWebのためにインポート
import 'package:flutter/material.dart';
import 'package:js/js.dart';

void main() {
  debugPrint("Flutter Web App is starting...");

  if (kIsWeb) {
    // HTMLのdiv要素にキャンバスを追加する
    debugPrint("Adding outputCanvasContainer to HTML body...");
    final container = html.DivElement()..id = 'outputCanvasContainer';
    final canvas = html.CanvasElement(width: 640, height: 480)..id = 'outputCanvas';
    container.append(canvas);
    html.document.body?.append(container);
  } else {
    debugPrint("This app is running in a non-Web environment.");
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint("Building MyApp widget...");
    return MaterialApp(
      home: VirtualBackgroundScreen(),
    );
  }
}

class VirtualBackgroundScreen extends StatelessWidget {
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
        title: Text('Virtual Background with Debug'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: HtmlElementView(viewType: 'outputCanvasContainer'), // Canvasを追加したコンテナを表示
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _changeBackground('assets/images/background1.jpg'),
                  child: Text('Background 1'),
                ),
                ElevatedButton(
                  onPressed: () => _changeBackground('assets/images/background2.jpg'),
                  child: Text('Background 2'),
                ),
                ElevatedButton(
                  onPressed: () => _changeBackground('assets/images/background3.jpg'),
                  child: Text('Background 3'),
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
