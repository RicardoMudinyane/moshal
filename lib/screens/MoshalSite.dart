import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MoshalSite extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Moshal Scholarship"),),
      body:  WebView(
        initialUrl: 'https://moshalscholarship.org//',
      ),
    );
  }



}
