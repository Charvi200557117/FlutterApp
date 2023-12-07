import 'package:flutter/material.dart';

class GreetingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Greeting Page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome to My Flutter App!'),
          Image.network('https://example.com/your-image.jpg'),
        ],
      ),
    );
  }
}
