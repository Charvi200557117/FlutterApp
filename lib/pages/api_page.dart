// lib/pages/api_page.dart
import 'package:flutter/material.dart';

class ApiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Dog API'),
      ),
      body: Center(
        child: Text('API Page Content'),
      ),
    );
  }
}
