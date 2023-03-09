import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:medteam/Screen/EnterMobile.dart';
import 'package:medteam/Screen/EnterName.dart';
import 'package:medteam/model/sign_up_reponse_mode.dart';
import '../../Utils/utils.dart';
import '../../model/eneter_name_reponse_model.dart';
import '../../repository/auth_repo.dart';

class EnterNameViewModel with ChangeNotifier {
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

  void enterNameWithData(
      TextEditingController fnameController,
      TextEditingController mnameController,
      TextEditingController lnameController,
      BuildContext context) {
    _isLoading = true;
    notifyListeners();
    Map data = {
      "first_name": fnameController.value.text.toString(),
      "last_name": lnameController.value.text.toString(),
      "user_id": 218
    };
    enterNameAPI(data, context);
  }

  Future<void> enterNameAPI(data, BuildContext context) async {
    //-------register api call-----------//

    await _myRepo.enterNameApi(data).then((value) async {
      EnterNameResponseModel enterNameResponseModel =
          EnterNameResponseModel.fromJson(value);

      if (enterNameResponseModel.status == true) {
        Utils.showSnackBar(
            context, enterNameResponseModel.message.toString(), Colors.blue);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => EnterMobileScreen(),
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
