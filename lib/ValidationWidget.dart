class ValidationWidget {
  static bool isName(String em) {
    return RegExp(r"^\D+$")
        .hasMatch(em.trim());
  }

  static bool isZipCode(String value) {
    //return RegExp(r'^[a-zA-Z0-9]$').hasMatch(value.trim());
    return RegExp(r'^[a-zA-Z0-9 ]{1,15}$').hasMatch(value.trim());
  }
  static bool validateUpiID(String value) {
    String pattern = '[a-zA-Z0-9.\-_]{2,256}@[a-zA-Z]{2,64}';
    RegExp regExp = RegExp(pattern);

    return regExp.hasMatch(value);
  }

  static bool isEmail(String em) {
    String emailRegexp =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(emailRegexp);

    return regExp.hasMatch(em.trim());
  }

  static bool isPass(String em) {
    String emailRegexp =
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[?!@#$%^&*()_+])(?=.*[a-zA-Z].*)[a-zA-Z\d\!?@#\$%&\*]{8,}$';

    RegExp regExp = RegExp(emailRegexp);
    bool isPasw = regExp.hasMatch(em);

    return isPasw;
  }

  static bool isphone(String value) {
    return RegExp(r'(^(?:[+0]9)?[0-9]{6,15}$)').hasMatch(value.trim());
  }

  static bool isMessage(String em) {
    String p = r"^[a-zA-Z0-9]+(([',. -][a-zA-Z0-9 ])?[a-zA-Z0-9]*)*$";
    RegExp regExp =  RegExp(p);
    return regExp.hasMatch(em.trim());
  }

  static bool isUrl(String em) {
    return RegExp(
            r"^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$")
        .hasMatch(em.trim());
  }

  static bool specialCha(String value) {
    //return RegExp(r'^[a-zA-Z0-9]$').hasMatch(value.trim());
    return RegExp(r'[!@#$%^&*(),.?":{}|<>]')
        .hasMatch(value.trim());
  }
  static bool NumberChara(String value) {
    //return RegExp(r'^[a-zA-Z0-9]$').hasMatch(value.trim());
    return  RegExp(r'[0-9]').hasMatch(value);
  }
  static bool upper_lower_case(String value) {
    //return RegExp(r'^[a-zA-Z0-9]$').hasMatch(value.trim());
    return  RegExp(r'[a-zA-Z]').hasMatch(value);
  }

  static bool upper_case(String value) {
    //return RegExp(r'^[a-zA-Z0-9]$').hasMatch(value.trim());
    return  RegExp(r'[A-Z]').hasMatch(value);
  }

  static bool lower_case(String value) {
    //return RegExp(r'^[a-zA-Z0-9]$').hasMatch(value.trim());
    return  RegExp(r'[a-z]').hasMatch(value);
  }
}
