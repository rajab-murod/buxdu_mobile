import 'package:flutter/material.dart';
import 'package:buxdumobile/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buxdu Mobile',
      debugShowCheckedModeBanner: false,
      home: HomePage(title: 'Buxdu Mobile'),
    );
  }
}

