import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _expression = ''; // Holds the current mathematical expression
  String _result = ''; // Holds the result of the evaluation

  // Function to handle button presses
  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        // Clear the expression and result
        _expression = '';
        _result = '';
      } else if (buttonText == '=') {
        // Evaluate the expression when the equal button is pressed
        _evaluateExpression();
      } else {
        // Append the pressed button text to the expression
        _expression += buttonText;
      }
    });
  }

  // Function to evaluate the mathematical expression
  void _evaluateExpression() {
    try {
      // Parse the expression using the math_expressions package
      Parser p = Parser();
      Expression exp = p.parse(_expression);
      ContextModel cm = ContextModel();
      // Evaluate the expression and update the result
      double result = exp.evaluate(EvaluationType.REAL, cm);
      _result = result.toString();
    } catch (e) {
      // Handle errors during expression evaluation
      _result = 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _expression,
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _result,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Divider(),
          // Button rows for digits and operators
          _buildButtonRow(['7', '8', '9', '/']),
          _buildButtonRow(['4', '5', '6', 'x']),
          _buildButtonRow(['1', '2', '3', '-']),
          // Bottom row with clear, zero, equal, and plus buttons
          _buildButtonRow(['C', '0', '=', '+']),
        ],
      ),
    );
  }

  // Function to build a row of buttons
  Widget _buildButtonRow(List<String> buttons) {
    return Expanded(
      child: Row(
        children: buttons
            .map(
              (button) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => _onButtonPressed(button),
                    child: Text(
                      button,
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
