import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/auth/signin.screen.dart';
import 'package:greengrocer/src/pages/splash/splash.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greengrocer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
      ),
      home: const SplashScreen(),
    );
  }
}
