import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:tamara_sdk_example/screen/render_webview/render_webview_page.dart';

class MyInAppWebviewWidget extends StatefulWidget {
  final ValueNotifier urlRenderPage;
  const MyInAppWebviewWidget({super.key, required this.urlRenderPage});

  @override
  State<MyInAppWebviewWidget> createState() => MyInAppWebviewWidgetState();
}

class MyInAppWebviewWidgetState extends State<MyInAppWebviewWidget> {
  late InAppWebViewController _webViewController;

  void loadWebview(String body) {
    String tamaraWidgetHtml = '''
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>
    <body>
        $body
    </body>
    </html>
      ''';
    _webViewController.loadData(
      data: tamaraWidgetHtml,
      mimeType: 'text/html',
      encoding: 'utf-8',
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          InAppWebView(
            onWebViewCreated: (controller) {
              _webViewController = controller;
            },
            initialUrlRequest: URLRequest(url: WebUri("")),
          ),
          Positioned(
            child: GestureDetector(
              onTap: () {
                if (widget.urlRenderPage.value.toString().isEmpty) {
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        RenderWebviewPage(url: widget.urlRenderPage.value),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
