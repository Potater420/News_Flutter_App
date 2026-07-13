import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsSitePage extends StatefulWidget {
  final String url;

  const NewsSitePage({super.key, required this.url});

  @override
  State<NewsSitePage> createState() => _NewsSitePageState();
}

class _NewsSitePageState extends State<NewsSitePage> {
  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));

    return Scaffold(
      appBar: AppBar(title: const Text('WebView')),
      body: WebViewWidget(controller: controller),
    );
  }
}
