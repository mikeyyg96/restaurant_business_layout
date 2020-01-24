import 'package:flutter/material.dart';
import 'package:restaurant_business_layout/pages/frame_page.dart';

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