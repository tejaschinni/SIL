import 'package:demo/apiIntegration/screen.dart';
import 'package:demo/apiIntegration/screen1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: screen1(),
    );
  }
}
