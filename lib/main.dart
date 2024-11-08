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
          ],
        ),
      ),
    );
  }
}

class CameraControl {
  static void initializeSegmentation() => js.context.callMethod('initializeSegmentation');

  static void startVideoStream() => js.context.callMethod('startVideoStream');

  static void stopVideoStream() => js.context.callMethod('stopVideoStream');

  static void toggleCamera() => js.context.callMethod('toggleCamera');

  static void changeBackground(String imagePath) => js.context.callMethod('changeBackground', [imagePath]);
}
