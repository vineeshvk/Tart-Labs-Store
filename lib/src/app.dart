import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tartlabsstore/src/screens/login/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Quicksand"),
      home: LoginScreen(),
    );
  }
}
