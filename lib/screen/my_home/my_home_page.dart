import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tamara_sdk_example/constant.dart';
import 'package:tamara_sdk_example/model/authorise_order.dart';
import 'package:tamara_sdk_example/model/cancel_order.dart';
import 'package:tamara_sdk_example/model/cancel_order_request.dart';
import 'package:tamara_sdk_example/model/capture.dart';
import 'package:tamara_sdk_example/model/cart_page.dart';
import 'package:tamara_sdk_example/model/e_amount.dart';
import 'package:tamara_sdk_example/model/order_detail.dart';
import 'package:tamara_sdk_example/model/order_reference.dart';
import 'package:tamara_sdk_example/model/payment_options.dart';
import 'package:tamara_sdk_example/model/product.dart';
import 'package:tamara_sdk_example/model/refund.dart';
import 'package:tamara_sdk_example/model/shipping_infor.dart';
import 'package:tamara_sdk_example/screen/render_webview/tamara_payment.dart';
import 'package:tamara_sdk_example/screen/test_create_order/test_create_order_page.dart';
import 'package:tamara_flutter_sdk/tamara_sdk.dart';
import 'package:tamara_sdk_example/widgets/dialog_input_capture.dart';
import 'package:tamara_sdk_example/widgets/dialog_input_cart_page_widget.dart';
import 'package:tamara_sdk_example/widgets/dialog_input_check_payment.dart';
import 'package:tamara_sdk_example/widgets/dialog_input_order_id_widget.dart';
import 'package:tamara_sdk_example/widgets/dialog_initsdk_widget.dart';
import 'package:tamara_sdk_example/widgets/dialog_input_refund_widget.dart';
import 'package:tamara_sdk_example/widgets/dialog_input_update_order_reference_id_widget.dart';
import 'package:tamara_sdk_example/widgets/dialog_show_result_widget.dart';
import 'package:tamara_sdk_example/widgets/my_app_bar_widget.dart';
import 'package:tamara_sdk_example/widgets/my_button_widget.dart';
import 'package:tamara_sdk_example/widgets/my_in_app_webview_widget.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<MyInAppWebviewWidgetState> webviewCartKey =
      GlobalKey<MyInAppWebviewWidgetState>();
  final GlobalKey<MyInAppWebviewWidgetState> webviewProductKey =
      GlobalKey<MyInAppWebviewWidgetState>();

  ValueNotifier<String> urlCartRenderPage = ValueNotifier("");
  ValueNotifier<String> urlProductRenderPage = ValueNotifier("");

  @override
  void initState() {
    super.initState();
    TamaraSdk.initSdk(
      AUTH_TOKEN,
      API_URL,
      NOTIFICATION_WEB_HOOK_URL,
      PUBLIC_KEY,
      NOTIFICATION_TOKEN,
      true,
    );
    // Initialize _webViewController here or in a function that sets up the WebView widget
    // Use addPostFrameCallback to call renderProduct after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await renderProduct("en", "SA", PUBLIC_KEY, 120.0);
      await renderCartPage("en", "SA", PUBLIC_KEY, 120.0);
    });
  }


  void getOrderDetail(String orderId) async {
    String result = await TamaraSdk.getOrderDetail(orderId);
    final orderDetail = OrderDetail.fromJson(jsonDecode(result));
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) {
        return DialogShowResultWidget(
          textResult: orderDetail.toString(),
        );
      },
    );
  }

  void authoriseOrder(String orderId) async {
    String result = await TamaraSdk.authoriseOrder(orderId);
    final authoriseOrder = AuthoriseOrder.fromJson(jsonDecode(result));
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) {
        return DialogShowResultWidget(
          textResult: authoriseOrder.toString(),
        );
      },
    );
  }

  void cancelOrder(String orderId) async {
    EAmount totalAmount = EAmount(amount: 2, currency: "SAR");
    CancelOrderRequest cancelOrderRequest =
        CancelOrderRequest(totalAmount: totalAmount);
    String result =
        await TamaraSdk.cancelOrder(orderId, jsonEncode(cancelOrderRequest));
    final cancelOrder = CancelOrder.fromJson(jsonDecode(result));
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) {
        return DialogShowResultWidget(
          textResult: cancelOrder.toString(),
        );
      },
    );
  }

  void updateOrderReference(String orderId, String orderReferenceId) async {
    String result =
        await TamaraSdk.updateOrderReference(orderId, orderReferenceId);
    final orderReference = OrderReference.fromJson(jsonDecode(result));
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) {
        return DialogShowResultWidget(
          textResult: orderReference.toString(),
        );
      },
    );
  }

  void capturePayment(String orderId, double amount) async {
    EAmount totalAmount = EAmount(amount: amount, currency: "SAR");
    ShippingInfo shippingInfo = ShippingInfo(
      shippedAt: "2019-08-24T14:15:22Z",
      shippingCompany: "DHL",
    );
    Capture capture = Capture(
        orderId: orderId, totalAmount: totalAmount, shippingInfo: shippingInfo);
    final result =
        await TamaraSdk.getCapturePayment(jsonEncode(capture.toJson()));
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) {
        return DialogShowResultWidget(
          textResult: result.toString(),
        );
      },
    );
  }

  void checkPaymentOptions(String country, double amount, String currency, String phoneNumber, bool isVip) async {
    EAmount orderValue = EAmount(amount: amount, currency: currency);
    PaymentOptions paymentOptions = PaymentOptions(country: country, orderValue: orderValue, phoneNumber: phoneNumber,
    isVip: isVip);
    final result = await TamaraSdk.checkPaymentOptions(jsonEncode(paymentOptions));
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) {
        return DialogShowResultWidget(
          textResult: result.toString(),
        );
      },
    );
  }

  void refunds(String orderId, double amount, String comment) async {
    EAmount totalAmount = EAmount(amount: amount, currency: "SAR");
    Refund refund = Refund(totalAmount: totalAmount, comment: comment);
    final result = await TamaraSdk.refunds(orderId, jsonEncode(refund));
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) {
        return DialogShowResultWidget(
          textResult: result.toString(),
        );
      },
    );
  }

  Future<void> renderCartPage(
      String language, String country, String publicKey, double amount) async {
    String result =
        await TamaraSdk.renderCartPage(language, country, publicKey, amount);
    final cartPage = CartPage.fromJson(jsonDecode(result));
    //Navigator.pop(context);
    webviewCartKey.currentState?.loadWebview(cartPage.script ?? "");
    urlCartRenderPage.value = cartPage.url ?? "";
  }

  Future<void> renderProduct(
      String language, String country, String publicKey, double amount) async {
    String result =
        await TamaraSdk.renderProduct(language, country, publicKey, amount);
    Product product = Product.fromJson(jsonDecode(result));
    webviewProductKey.currentState?.loadWebview(product.script ?? "");
    urlProductRenderPage.value = product.url ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarWidget(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              MyButtonWidget(
                title: "INIT",
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const DialogInitSdkWidget();
                    },
                  );
                },
              ),
               MyButtonWidget(
                title: "PRODUCT WIDGET",
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DialogInputCartPageWidget(onPress: renderProduct);
                    },
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: urlProductRenderPage,
                builder: (context, value, child) {
                  return MyInAppWebviewWidget(
                      key: webviewProductKey,
                      urlRenderPage: urlProductRenderPage);
                },
              ),
              MyButtonWidget(
                title: "CHECKOUT WIDGET",
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DialogInputCartPageWidget(onPress: renderCartPage);
                    },
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: urlCartRenderPage,
                builder: (context, value, child) {
                  return MyInAppWebviewWidget(
                      key: webviewCartKey, urlRenderPage: urlCartRenderPage);
                },
              ),
              MyButtonWidget(
                title: "TEST CREATE ORDER",
                onPressed: () {
                  TamaraSdk.createOrder("123", "description");
                  TamaraSdk.setInstalments(1);
                  TamaraSdk.setLocale("en-US");
                  TamaraSdk.setPlatform("Android");//IOS
                  TamaraSdk.setCountry("AE", "AED");
                  TamaraSdk.setCurrency("AED");
                  TamaraSdk.addCustomFieldsAdditionalData(
                      "{\"custom_field1\": 42, \"custom_field2\": \"value2\" }");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TestCreateOrderPage(),
                      ));
                },
              ),
              MyButtonWidget(
                title: "TEST CREATE ORDER BY URL",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TamaraPayment(
                          url:
                              "https://checkout-sandbox.tamara.co/checkout/329d2c3a-c8c1-40fe-8730-451f7143b594?locale=en_US&orderId=9e609393-085f-4e25-b495-3ee7cc0c9d90&show_item_images=with_item_images_shown&pay_the_difference_disclaimer=blue1&pay_in_full_value=full_values",
                          isCheckoutWebview: true,
                        ),
                      ));
                },
              ),
              MyButtonWidget(
                title: "GET ORDER DETAIL",
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DialogInputOrderIdWidget(onPress: getOrderDetail);
                    },
                  );
                },
              ),
              MyButtonWidget(
                title: "AUTHORISE ORDER",
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DialogInputOrderIdWidget(onPress: authoriseOrder);
                    },
                  );
                },
              ),
              MyButtonWidget(
                title: "CANCEL ORDER",
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DialogInputOrderIdWidget(onPress: cancelOrder);
                    },
                  );
                },
              ),
              MyButtonWidget(
                title: "UPDATE ORDER REFERENCE ID",
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DialogUpdateOrderReferenceId(
                          onPress: updateOrderReference);
                    },
                  );
                },
              ),
              MyButtonWidget(
                title: "CAPTURE",
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DialogInputCaptureWidget(onPress: capturePayment);
                    },
                  );
                },
              ),
              MyButtonWidget(
                title: "REFUND",
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DialogInputRefundWidget(onPress: refunds);
                    },
                  );
                },
              ),
              MyButtonWidget(
                title: "CHECK PAYMENT OPTIONS",
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DialogInputCheckPayment(onPress: checkPaymentOptions);
                    },
                  );
                },
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
