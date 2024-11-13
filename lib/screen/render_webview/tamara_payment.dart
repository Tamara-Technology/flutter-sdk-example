import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tamara_flutter_sdk/tamara_checkout.dart';
import 'package:tamara_sdk_example/screen/my_home/my_home_page.dart';
import 'package:tamara_sdk_example/widgets/my_app_bar_widget.dart';

class TamaraPayment extends StatefulWidget {
  final String url;
  final bool? isCheckoutWebview;

  const TamaraPayment(
      {super.key, required this.url, this.isCheckoutWebview});

  @override
  State<TamaraPayment> createState() => _TamaraPaymentState();
}

class _TamaraPaymentState extends State<TamaraPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isCheckoutWebview == true ? null : const MyAppBarWidget(),
      body: SafeArea(
        child: Column(
          children: [
              Expanded(
              child: TamaraCheckout(
                widget.url,
                "tamara://checkout/success",
                "tamara://checkout/fail",
                "tamara://checkout/cancel",
                onPaymentSuccess: () {
                  _onPaymentSuccess();
                },
                onPaymentFailed: () {
                  _onPaymentFailed();
                },
                onPaymentCanceled: () {
                  _onPaymentCanceled();
                },
              )
            )
          ],
        ),
      ),
    );
  }

  void _onPaymentSuccess() {
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

  void _onPaymentFailed() {
    Fluttertoast.showToast(
        msg: "Payment Failed",
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

  void _onPaymentCanceled() {
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
  }

}
