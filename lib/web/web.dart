import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Web extends StatelessWidget {
  final String url;
  Web(this.url);
  //const Web({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:WebView(
        initialUrl:url ,
      )
    );
  }
}
