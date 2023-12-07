// lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/greeting_page.dart';
import 'pages/calculator_page.dart';
import 'pages/api_page.dart';
import 'pages/notes_page.dart';
import 'pages/page5.dart';
import 'pages/page6.dart';
import 'pages/page7.dart';
import 'pages/page8.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Flutter App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => GreetingPage()),
        GetPage(name: '/calculator', page: () => CalculatorPage()),
        GetPage(name: '/api', page: () => ApiPage()),
        GetPage(name: '/notes', page: () => NotesPage()),
        GetPage(name: '/page5', page: () => Page5()),
        GetPage(name: '/page6', page: () => Page6()),
        GetPage(name: '/page7', page: () => Page7()),
        GetPage(name: '/page8', page: () => Page8()),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
