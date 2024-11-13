// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
// ignore: avoid_web_libraries_in_flutter
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
