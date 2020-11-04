import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bbank/screens/dashboard.dart';

void main() {
  runApp(ByteBank());
}

class ByteBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.cyan),
      home: Dashboard(),
    );
  }
}
