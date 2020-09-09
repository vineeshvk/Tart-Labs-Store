import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tartlabsstore/routes.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Quicksand"),
      onGenerateRoute: Routes.getRoute,
      debugShowCheckedModeBanner: false,
      home: addAuthBloc(context, Container()),
    );
  }
}
