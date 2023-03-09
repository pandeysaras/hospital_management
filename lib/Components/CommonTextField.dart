import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medteam/Utils/colors.dart';

class CommonTextField extends StatelessWidget {
  TextEditingController thecontroller;
  String label;
  Function focusChange;
  TextInputAction action;
  TextInputType type;
  bool secure;
  int lines;
  FocusNode focusNode;
  double fontSize;
  bool enable;
  String font_family;
  Color text_color;
  Color hint_color;

  CommonTextField({
    required this.thecontroller,
    required this.label,
    required this.type,
    required this.action,
    this.secure = false,
    required this.focusChange,
    this.lines = 1, required this.fontSize,
    required this.focusNode,
    this.enable = true,
    this.font_family='nunit_regular',
    required this.text_color,
    required this.hint_color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: black, width: 1),
      ),
      child:Row(
        children: [
          Expanded(
            child: TextField(
                maxLines: lines,
                keyboardType: type,
                textInputAction: action,
                obscureText: secure,
                autofocus: false,
                enabled: enable,
                cursorColor: text_color,
                style: TextStyle(
                  fontSize: fontSize,
                  color: text_color,
                  fontFamily: font_family,
                ),
                controller: thecontroller,
                focusNode: focusNode,
                onEditingComplete: () {
                  focusChange();
                },
                decoration: InputDecoration(
                  focusedBorder: border,
                  border: border,
                  enabledBorder: border,
                  disabledBorder: border,
                  contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                  hintText: label,
                  hintStyle: TextStyle(
                    fontSize: fontSize,
                    color: hint_color,
                    fontFamily: font_family,
                  ),

                )),
          ),
        ],
      ),
    );
  }

  final border = UnderlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide.none,
  );
}
