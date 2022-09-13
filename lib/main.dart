import 'package:flutter/material.dart';
import 'package:news_api_flutter_test/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      showSemanticsDebugger: false,
      home: HomePage(),
    );
  }
}
