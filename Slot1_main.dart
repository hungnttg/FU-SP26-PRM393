import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('PRM393 -flutter')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Xin chao Flutter', style: TextStyle(fontSize: 30)),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  print('Button clicked');
                },
                child: Text('Click me'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
