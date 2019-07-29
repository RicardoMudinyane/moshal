import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Gallery extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Gallery"),),
      body:  WebView(
        initialUrl: 'https://www.facebook.com/pg/MoshalScholarshipProgram/photos/?ref=page_internal/',
      ),
    );
  }



}