// lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/greeting_page.dart';
import 'pages/calculator.dart';
import 'pages/api.dart';
import 'pages/notes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Flutter App',
      initialRoute: '/', // Set the initial route to the GreetingPage
      getPages: [
        GetPage(name: '/', page: () => GreetingPage()), // Route for the GreetingPage
        GetPage(name: '/calculator', page: () => CalculatorApp()), // Route for the CalculatorApp
        GetPage(name: '/api', page: () => RandomDogApp()), // Route for the RandomDogApp
        GetPage(name: '/notes', page: () => NotesApp()), // Route for the NotesApp
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
