import 'package:flutter/material.dart';
import 'package:miniproject/Category.dart';
import 'package:miniproject/Register.dart';
import 'package:miniproject/Search.dart';
import 'package:miniproject/Shopping.dart';
import 'package:miniproject/login.dart';
import 'package:miniproject/welcome.dart';
import 'package:miniproject/Page1.dart';
import 'Profile.dart';
// backgroundColor: Color(0xE1D8D6EC)

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Welcome(),
    );
  }
}

