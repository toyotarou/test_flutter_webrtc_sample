// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:ui' as ui;
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
        body: const IFrameController(),
      ),
    );
  }
}

class IFrameController extends StatefulWidget {
  const IFrameController({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IFrameControllerState createState() => _IFrameControllerState();
}

class _IFrameControllerState extends State<IFrameController> {
  late html.IFrameElement _iframeElement;

  @override
  void initState() {
    super.initState();

    // IFrameElementを作成し、登録する
    _iframeElement = html.IFrameElement()
      ..src = 'camera.html'
      ..style.border = 'none'
      ..style.width = '100%'
      ..style.height = '100%';

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry
        .registerViewFactory('camera-iframe', (int viewId) => _iframeElement);
  }

  void sendMessageToIFrame(String command, [String? imagePath]) {
    final message = {'command': command, 'imagePath': imagePath};
    _iframeElement.contentWindow?.postMessage(message, '*');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(child: Text('JavaScriptで機能を制御しています。')),
        ElevatedButton(
          onPressed: () => sendMessageToIFrame('toggleCamera'),
          child: const Text('カメラ ON/OFF'),
        ),
        ElevatedButton(
          onPressed: () => sendMessageToIFrame(
              'changeBackground', '/assets/images/background1.jpg'),
          child: const Text('背景1'),
        ),
        ElevatedButton(
          onPressed: () => sendMessageToIFrame(
              'changeBackground', '/assets/images/background2.jpg'),
          child: const Text('背景2'),
        ),
        ElevatedButton(
          onPressed: () => sendMessageToIFrame(
              'changeBackground', '/assets/images/background3.jpg'),
          child: const Text('背景3'),
        ),
        const Expanded(child: HtmlElementView(viewType: 'camera-iframe')),
      ],
    );
  }
}
