// import 'package:apiprueba/screens/home_screens';
import 'package:apiprueba/screens/home_screen.dart';
import 'package:apiprueba/widgets/title.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
              title: Center(
                child: APPTitle(text: 'PELIAPP')
                ),
              ),

        body: HomeScreenn(),
      ),
    );
  }
}
