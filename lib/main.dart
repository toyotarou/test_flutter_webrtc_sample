import 'dart:html' as html;
import 'dart:js' as js;
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web with JavaScript',
      home: Scaffold(
        appBar: AppBar(title: const Text('Virtual Background Example')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text('JavaScriptで機能を制御しています。')),
            ElevatedButton(
              onPressed: () => html.window.location.href = 'camera.html',
              child: const Text('カメラ画面へ'),
            ),
            ElevatedButton(
              onPressed: toggleCamera,
              child: const Text('カメラ ON/OFF'),
            ),
            ElevatedButton(
              onPressed: () => changeBackground('/assets/images/background1.jpg'),
              child: const Text('背景1'),
            ),
            ElevatedButton(
              onPressed: () => changeBackground('/assets/images/background2.jpg'),
              child: const Text('背景2'),
            ),
            ElevatedButton(
              onPressed: () => changeBackground('/assets/images/background3.jpg'),
              child: const Text('背景3'),
            ),
          ],
        ),
      ),
    );
  }

  // カメラのオン/オフを切り替えるDart関数
  void toggleCamera() {
    js.context.callMethod('toggleCamera');
  }

  // 背景画像を変更するDart関数
  void changeBackground(String imagePath) {
    js.context.callMethod('changeBackground', [imagePath]);
  }
}
