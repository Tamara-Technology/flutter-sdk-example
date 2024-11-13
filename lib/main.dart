import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tamara_sdk_example/constant.dart';
import 'package:tamara_flutter_sdk/tamara_sdk.dart';
import 'package:tamara_sdk_example/screen/my_home/my_home_page.dart';
import 'package:tamara_sdk_example/widgets/dialog_show_result_widget.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tamara SDK Example',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
      home: const MyHomePage(),
    );
  }
}
