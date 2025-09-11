import 'package:flutter/material.dart';
import 'multiply_service.dart';
import 'division_service.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _output = "0";
  double _num1 = 0.0;
  String _operator = "";
  bool _clearDisplay = false;

  void _handleButtonPress(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0";
        _num1 = 0.0;
        _operator = "";
        _clearDisplay = false;
      } else if (buttonText == "+" || buttonText == "-" || buttonText == "x" || buttonText == "/") {
        _num1 = double.parse(_output);
        _operator = buttonText;
        _clearDisplay = true;
      } else if (buttonText == "=") {
        double num2 = double.parse(_output);
        switch (_operator) {
          case "+": _output = (_num1 + num2).toString(); break;
          case "-": _output = (_num1 - num2).toString(); break;
          case "x": _output = MultiplyService.multiply(_num1, num2); break;
          case "/": _output = DivisionService.divide(_num1, num2); break;
          default: break;
        }
        _num1 = 0.0;
        _operator = "";
        _clearDisplay = false;
      } else {
        if (_clearDisplay) {
          _output = buttonText;
          _clearDisplay = false;
        } else if (_output == "0") {
          _output = buttonText;
        } else {
          _output += buttonText;
        }
      }
    });
  }

  Widget _buildButton(String text, {Color? color}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => _handleButtonPress(text),
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.grey[800],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(20),
          ),
          child: Text(text, style: const TextStyle(fontSize: 24)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculator UI"), backgroundColor: Colors.transparent, elevation: 0),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(24),
              child: Text(_output, style: Theme.of(context).textTheme.displayLarge, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
          ),
          Column(
            children: [
              Row(children: [_buildButton("C", color: Colors.grey[700]), _buildButton("("), _buildButton(")"), _buildButton("/", color: Colors.orange)]),
              Row(children: [_buildButton("7"), _buildButton("8"), _buildButton("9"), _buildButton("x", color: Colors.orange)]),
              Row(children: [_buildButton("4"), _buildButton("5"), _buildButton("6"), _buildButton("-", color: Colors.orange)]),
              Row(children: [_buildButton("1"), _buildButton("2"), _buildButton("3"), _buildButton("+", color: Colors.orange)]),
              Row(children: [_buildButton("0"), _buildButton("."), _buildButton("=")]),
            ],
          )
        ],
      ),
    );
  }
}
