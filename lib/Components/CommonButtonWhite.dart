import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medteam/Utils/colors.dart';

class CommonButtonWhite extends StatelessWidget {
  String label;
  double fontSize;
  VoidCallback onPressed;
  double border;
  double height;
  Color textColor;
  Color backgroundColor;


  CommonButtonWhite({
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
              blurRadius: 3.0,),],
          color: white,
          borderRadius: BorderRadius.circular(border)
      ),

      child:ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),

        onPressed: this.onPressed,
        child: Padding(
          padding: EdgeInsets.only(left: 15,right: 15),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontFamily: 'nunit_extrabold',
                ),

          ),
        ),
      ),
    );
  }
}
