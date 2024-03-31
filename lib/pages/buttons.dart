import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final color;
  final textcolor;
  final buttontext;
  final buttontapped;
  MyButtons({this.color, this.buttontext, this.textcolor, this.buttontapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: ClipRect(
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(25)),
          child: Center(
            child: Text(
              buttontext,
              style: TextStyle(color: textcolor, fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
