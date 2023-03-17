import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../Screen/FindWork.dart';
import '../../Utils/utils.dart';
import '../../repository/auth_repo.dart';

class LoginViewModel with ChangeNotifier{
  final _authRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> postLoginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _authRepo.loginApi(data).then((value) {
      setLoading(false);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FindWork()));
      Utils.showSnackBar(
          context, value["message"], Colors.blue);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.showSnackBar(
          context,"Invalid password or email!", Colors.red);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}