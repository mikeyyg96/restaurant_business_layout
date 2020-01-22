import 'package:flutter/material.dart';
import 'frame.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFFEDFAFD),
        accentColor: Color(0xFFAED9DA),
        fontFamily: 'LemonJuice'
      ),
      home: FramePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}