import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(RandomDogApp());
}

class RandomDogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Dog App',
      home: RandomDogScreen(),
    );
  }
}

class RandomDogScreen extends StatefulWidget {
  @override
  _RandomDogScreenState createState() => _RandomDogScreenState();
}

class _RandomDogScreenState extends State<RandomDogScreen> {
  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Dog Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageUrl.isNotEmpty
                ? Image.network(
                    imageUrl,
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  )
                : CircularProgressIndicator(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                fetchRandomDog();
              },
              child: Text('Fetch Random Dog'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> fetchRandomDog() async {
    final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final String dogImageUrl = data['message'];
      setState(() {
        imageUrl = dogImageUrl;
      });
    } else {
      // Handle error
      print('Failed to fetch a random dog. Status code: ${response.statusCode}');
    }
  }
}
