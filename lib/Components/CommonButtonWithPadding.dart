import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommonButtonWithPadding extends StatelessWidget {
  String label;
  double fontSize;
  VoidCallback onPressed;
  double border;
  double height;
  Color textColor;
  Color backgroundColor;


  CommonButtonWithPadding({
    required this.label,
    required this.onPressed,
    required this.border,
    required this.height,
    required this.fontSize,
    required this.textColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: width,
      height: height,
      decoration: new BoxDecoration(
        boxShadow: [
        BoxShadow(
        blurRadius: 3.0,
      ),
    ],
        gradient: LinearGradient(colors: [Color(0xFF0075B2),Color(0xFF3BA9E2)]),
        borderRadius: BorderRadius.circular(border)
      ),
      child:ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
        onPressed: this.onPressed,
        child: Padding(
          padding: EdgeInsets.only(left: 50,right: 50),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontFamily: 'nunit_extrabold',
                shadows: <Shadow>[
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(3.0, 3.0),
                  ),]),

          ),
        ),
      ),
    );
  }
}
