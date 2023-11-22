import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class ArticlesView extends StatefulWidget {
  const ArticlesView({
    super.key,
  });
  static String id = "ArticlesView";

  @override
  State<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<ArticlesView> {
  late final WebViewController controller;

  @override
  Widget build(BuildContext context) {
    final String url = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          " World News",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
