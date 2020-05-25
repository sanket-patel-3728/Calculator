import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonTapped;

  MyButton({this.color, this.textColor, this.buttonText,this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.green[400],
                      offset: Offset(6.0, 6.0),
                      blurRadius: 14,
                      spreadRadius: 1),
                  BoxShadow(
                      color: Colors.white30,
                      offset: Offset(-6.0, -6.0),
                      blurRadius: 14,
                      spreadRadius: 1)
                ]),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: 29.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
      ),
    );
  }
}
