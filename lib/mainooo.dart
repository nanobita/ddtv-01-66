import 'package:flutter/material.dart';
// import 'package:ddtvthairadio/mainmmm.dart';
import 'package:ddtvthairadio/splash_screen.dart';
import 'package:ddtvthairadio/maink.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
