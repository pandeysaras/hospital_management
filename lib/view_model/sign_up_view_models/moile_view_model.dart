import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medteam/Screen/EnterMobile.dart';
import 'package:medteam/Screen/EnterName.dart';
import 'package:medteam/Screen/ProfilePhoto.dart';
import 'package:medteam/model/mobile_number_otp_model.dart';
import 'package:medteam/model/sign_up_reponse_mode.dart';
import '../../Utils/utils.dart';
import '../../model/eneter_name_reponse_model.dart';
import '../../repository/auth_repo.dart';

class EnterMobileNumberViewModel with ChangeNotifier {
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
      TextEditingController mobileNumberController, BuildContext context) {
    _isLoading = true;
    notifyListeners();
    Map data = {
      "phone": mobileNumberController.value.text,
      "user_id": "218",
    };
    mobileNumberOTP(data, context);
  }

  Future<void> mobileNumberOTP(data, BuildContext context) async {
    //-------register api call-----------//

    await _myRepo.mobileNumberOTP(data).then((value) async {
      MobileOTPResponseModel mobileOTPResponseModel =
          MobileOTPResponseModel.fromJson(value);

      if (mobileOTPResponseModel.status == true) {
        Utils.showSnackBar(
            context, mobileOTPResponseModel.message.toString(), Colors.blue);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => ProfilePhotoScreen(), //
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
