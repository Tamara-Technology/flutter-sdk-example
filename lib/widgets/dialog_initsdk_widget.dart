import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tamara_sdk_example/constant.dart';
import 'package:tamara_flutter_sdk/tamara_sdk.dart';
import 'package:tamara_sdk_example/widgets/my_button_widget.dart';
import 'package:tamara_sdk_example/widgets/my_text_field_widget.dart';

class DialogInitSdkWidget extends StatefulWidget {
  const DialogInitSdkWidget({super.key});

  @override
  State<DialogInitSdkWidget> createState() => _DialogInitSdkWidgetState();
}

class _DialogInitSdkWidgetState extends State<DialogInitSdkWidget> {
  ValueNotifier<String> authTokenValueNotifier = ValueNotifier(AUTH_TOKEN);

  ValueNotifier<String> apiUrlValueNotifier = ValueNotifier(API_URL);

  ValueNotifier<String> notificationWebHookUrlValueNotifier =
      ValueNotifier(NOTIFICATION_WEB_HOOK_URL);

  ValueNotifier<String> publishKeyValueNotifier = ValueNotifier(PUBLIC_KEY);

  ValueNotifier<String> notificationTokenValueNotifier =
      ValueNotifier(NOTIFICATION_TOKEN);

  void onPressed() {
    if (authTokenValueNotifier.value.isEmpty |
        apiUrlValueNotifier.value.isEmpty |
        notificationWebHookUrlValueNotifier.value.isEmpty |
        publishKeyValueNotifier.value.isEmpty |
        notificationTokenValueNotifier.value.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please input",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: const Color.fromARGB(255, 110, 110, 110),
          textColor: Colors.white,
          fontSize: 14.0);
      return;
    }
    TamaraSdk.initSdk(
      authTokenValueNotifier.value,
      apiUrlValueNotifier.value,
      notificationWebHookUrlValueNotifier.value,
      publishKeyValueNotifier.value,
      notificationTokenValueNotifier.value,
      true,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
      elevation: 0.0,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3),
          ),
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyTextFieldWidget(
                      textValueNotifier: authTokenValueNotifier,
                      hintText: "AUTH_TOKEN",
                    ),
                    const SizedBox(height: 10),
                    MyTextFieldWidget(
                      textValueNotifier: apiUrlValueNotifier,
                      hintText: "API_URL",
                    ),
                    const SizedBox(height: 10),
                    MyTextFieldWidget(
                      textValueNotifier: notificationWebHookUrlValueNotifier,
                      hintText: "NOTIFICATION_WEB_HOOK_URL",
                    ),
                    const SizedBox(height: 10),
                    MyTextFieldWidget(
                      textValueNotifier: publishKeyValueNotifier,
                      hintText: "PUBLIC_KEY",
                    ),
                    const SizedBox(height: 10),
                    MyTextFieldWidget(
                      textValueNotifier: notificationTokenValueNotifier,
                      hintText: "NOTIFICATION_TOKEN",
                    ),
                    const SizedBox(height: 10),
                    MyButtonWidget(
                      title: "OK",
                      onPressed: () {
                        onPressed();
                      },
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
