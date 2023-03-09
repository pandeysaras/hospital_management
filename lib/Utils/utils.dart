import 'package:flutter/material.dart';
// 

class Utils {
  //-----------------Focus node-----------------//

  static void fieldFocusChange(
    BuildContext context,
    FocusNode current,
    FocusNode nextFocus,
  ) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  //----------------Show Snack Bar-------------//

  static showSnackBar(BuildContext context, String msg, Color color) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: color,
      ),
    );
  }

  //------------------------Height and with of Device--------------------//

  static height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static showLoader(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.blue[700],
            ),
          );
        });
  }
}
