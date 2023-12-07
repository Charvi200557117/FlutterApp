// lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/greeting_page.dart';
import 'pages/calculator_page.dart';
import 'pages/api_page.dart';
import 'pages/notes_page.dart';

void main() => runApp(MyApp());

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
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
