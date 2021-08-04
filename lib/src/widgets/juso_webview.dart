import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../models/juso.dart';

class JusoWebView extends StatefulWidget {
  final Widget? loader;

  const JusoWebView({
    Key? key,
    this.loader,
  }) : super(key: key);

  @override
  _JusoWebViewState createState() => _JusoWebViewState();
}

class _JusoWebViewState extends State<JusoWebView> {
  final assetPath = 'packages/juso/assets/index.html';
  final options = InAppWebViewGroupOptions(
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
  );

  final localHostServer = InAppLocalhostServer();
  bool isLoading = true;

  Future<void> startServer() async {
    await localHostServer.start();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
    }
    startServer();
  }

  @override
  void dispose() {
    localHostServer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? widget.loader ?? const Center(child: CircularProgressIndicator())
        : InAppWebView(
            initialOptions: options,
            initialUrlRequest: URLRequest(
              url: Uri.parse('http://localhost:8080/$assetPath'),
            ),
            onWebViewCreated: (controller) async {
              controller.addJavaScriptHandler(
                handlerName: 'onSelect',
                callback: (arguments) {
                  if (arguments.isEmpty) return Navigator.pop(context);
                  final juso = Juso.fromJson(jsonDecode(arguments.first));
                  Navigator.pop(context, juso);
                },
              );
            },
          );
  }
}
