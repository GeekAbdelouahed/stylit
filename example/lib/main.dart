import 'package:flutter/material.dart';
import 'package:stylit/stylit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stylit Demo',
      home: Scaffold(
        body: Center(
          child: Column(
            spacing: 28,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StylitText(
                '<span>Flutter</span> <span>everything</span> is a <span>Widget</span>',
                customStyles: [
                  TextStyle(
                    color: Colors.blue,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.red,
                    decorationStyle: TextDecorationStyle.double,
                  ),
                  TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              '<p>Flutter</p> <p>everything</p> is a <p>Widget</p>'.stylit(
                tag: 'p',
                customStyles: [
                  TextStyle(
                    color: Colors.blue,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.red,
                    decorationStyle: TextDecorationStyle.double,
                  ),
                  TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
