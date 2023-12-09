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
            // Display the dog image or a loading indicator
            imageUrl.isNotEmpty
                ? Image.network(
                    imageUrl,
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  )
                : CircularProgressIndicator(),
            SizedBox(height: 20),
            // Button to fetch a new random dog image
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

  // Function to fetch a random dog image from the API
  Future<void> fetchRandomDog() async {
    try {
      // Send a GET request to the Dog API
      final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));

      // Check if the response status code is 200 (OK)
      if (response.statusCode == 200) {
        // Parse the JSON response
        final Map<String, dynamic> data = json.decode(response.body);
        // Extract the dog image URL from the response
        final String dogImageUrl = data['message'];
        // Update the state to display the new dog image
        setState(() {
          imageUrl = dogImageUrl;
        });
      } else {
        // Handle error if the response status code is not 200
        print('Failed to fetch a random dog. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle other errors that may occur during the request
      print('Error fetching a random dog: $error');
    }
  }
}
