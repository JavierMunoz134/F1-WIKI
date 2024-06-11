import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(F1App());
}

class F1App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F1 App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}