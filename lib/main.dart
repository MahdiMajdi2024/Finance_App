import 'package:finance_app/screen/home_screen.dart';
import 'package:finance_app/screen/statistics.dart';
import 'package:finance_app/screen/widget/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
    );
  }
}
