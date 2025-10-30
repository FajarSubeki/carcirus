import 'package:flutter/material.dart';
import 'navigation/main_navigation.dart';

void main() {
  runApp(const CarCirusApp());
}

class CarCirusApp extends StatelessWidget {
  const CarCirusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CarCirus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MainNavigation(),
    );
  }
}
