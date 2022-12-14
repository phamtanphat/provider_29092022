import 'package:flutter/material.dart';
import 'package:provider_29092022/demo_change_notifier.dart';
import 'package:provider_29092022/demo_provider_basic.dart';
import 'package:provider_29092022/demo_proxy_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DemoProxyProvider(),
    );
  }
}
