// lib/pages/greeting_page.dart
import 'package:flutter/material.dart';
import 'calculator.dart'; // Import the calculator page
import 'api.dart'; // Import the API page
import 'notes.dart'; // Import the notes page

class GreetingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Greetings!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlue,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to My Flutter App!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              // Network Image
              Image.network(
                'https://i.pinimg.com/736x/31/de/4e/31de4e9b4492297c63001c20f5eb4e54.jpg', // Replace with your actual network image URL
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
              Text(
                '"Great to see you!!"',
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              // Navigation Buttons
              ElevatedButton(
                onPressed: () {
                  // Navigate to the calculator page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalculatorApp()),
                  );
                },
                child: Text('Go to Calculator Page'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the random dog API generator page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RandomDogApp()),
                  );
                },
                child: Text('Go to Random Dog Api Generator Page'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the notes page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotesApp()),
                  );
                },
                child: Text('Go to Add Notes Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
