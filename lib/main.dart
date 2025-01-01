import 'package:e_com_app/view/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:e_com_app/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: BottomNavBar()),
    );
  }
}
