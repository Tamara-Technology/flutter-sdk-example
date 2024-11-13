import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tamara_sdk_example/screen/my_home/my_home_page.dart';
import 'package:tamara_sdk_example/widgets/my_app_bar_widget.dart';

class RenderWebviewPage extends StatefulWidget {
  final String url;
  final bool? isCheckoutWebview;

  const RenderWebviewPage(
      {super.key, required this.url, this.isCheckoutWebview});

  @override
  State<RenderWebviewPage> createState() => _RenderWebviewPageState();
}

class _RenderWebviewPageState extends State<RenderWebviewPage> {
  late InAppWebViewController _webViewController;

  void onLoadStart(String url) {
    if (url.contains("tamara://checkout/cancel")) {
      Fluttertoast.showToast(
          msg: "Payment cancel",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: const Color.fromARGB(255, 110, 110, 110),
          textColor: Colors.white,
          fontSize: 14.0);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
        (route) => false,
      );
    } else if (url.contains("tamara://checkout/success")) {
      Fluttertoast.showToast(
          msg: "Payment success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: const Color.fromARGB(255, 110, 110, 110),
          textColor: Colors.white,
          fontSize: 14.0);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isCheckoutWebview == true ? null : const MyAppBarWidget(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: InAppWebView(
                onLoadStart: (controller, url) {
                  onLoadStart(url.toString());
                },
                onWebViewCreated: (controller) {
                  _webViewController = controller;
                },
                initialUrlRequest: URLRequest(url: WebUri(widget.url)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
