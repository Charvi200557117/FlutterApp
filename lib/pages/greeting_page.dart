// lib/pages/greeting_page.dart
import 'package:flutter/material.dart';

class GreetingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome to My App')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Hello, Welcome to My Flutter App!'),
          Image.network('https://example.com/your-image.jpg'),
        ],
      ),
    );
  }
}
