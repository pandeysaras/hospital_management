import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:medteam/Screen/EnterName.dart';
import 'package:medteam/model/sign_up_reponse_mode.dart';
import '../../Utils/utils.dart';
import '../../repository/auth_repo.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _isChecked = false;
  bool _isLoading = false;
  bool get isChecked => _isChecked;
  bool get isLoading => _isLoading;

  void setCheckBox(bool newValue) {
    _isChecked = newValue;
    if (kDebugMode) {
      print("isChecked $_isChecked");
    }
    notifyListeners();
  }

  void setLoading() {
    if (_isLoading == true) {
      _isLoading = false;
    } else {
      _isLoading = true;
    }
    if (kDebugMode) {
      print(_isChecked);
    }
    notifyListeners();
  }

  void signUpWithData(
      TextEditingController emailcontroller,
      TextEditingController cemailcontroller,
      TextEditingController passcontroller,
      TextEditingController cpascontroller,
      BuildContext context) {
    _isLoading = true;
    notifyListeners();
    Map data = {
      "email": emailcontroller.value.text.toString(),
      "password": passcontroller.value.text.toString(),
      "confirm_password": cpascontroller.value.text.toString(),
      "terms_conditions": "1",
      "independent_contract": "1"
    };
    registerAPI(data, context);
  }

  Future<void> registerAPI(data, BuildContext context) async {
    //-------register api call-----------//

    await _myRepo.registerApi(data).then((value) async {
      SignUpResponseModel signUpResponseModel =
          SignUpResponseModel.fromJson(value);

      if (signUpResponseModel.status == true) {
        Utils.showSnackBar(
            context, signUpResponseModel.message.toString(), Colors.blue);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => EnterNameScreen(),
          ),
        );

        _isLoading = false;
        notifyListeners();
      }

      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) async {
      _isLoading = false;
      notifyListeners();
      throw {
        await Utils.showSnackBar(context, '$error', Colors.red),
        if (kDebugMode)
          {
            print(error.toString()),
          }
      };
    });
  }

  //---------------------------------
}
