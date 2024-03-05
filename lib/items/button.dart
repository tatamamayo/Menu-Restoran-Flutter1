import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _incrementCounter,
                child: Text('+'),
              ),
              SizedBox(width: 10),
              Text(
                '$_counter',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: _decrementCounter,
                child: Text('-'),
              ),
            ],
          ),
        );
  }
}