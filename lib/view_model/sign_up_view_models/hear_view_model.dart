import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:medteam/model/hear_about_us_model.dart';

import '../../repository/hear_about_us_repo.dart';

class HearAboutUSViewModel with ChangeNotifier {
  final _myRepo = HearRepository();

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

  // void enterNameWithData(
  //     TextEditingController fnameController,
  //     TextEditingController mnameController,
  //     TextEditingController lnameController,
  //     BuildContext context) {
  //   _isLoading = true;
  //   notifyListeners();
  //   Map data = {
  //     "first_name": fnameController.value.text.toString(),
  //     "last_name": lnameController.value.text.toString(),
  //     "user_id": 218
  //   };
  //   enterNameAPI(data, context);
  // }

  List<Data> selectBoxesHearList = [];

  Future<void> getHearAboutUs() async {
    //-------register api call-----------//

    await _myRepo.hearAboutUsEndPoint().then((value) async {
      globalhearAboutUsModel = HearAboutUsModel.fromJson(value);

      print(value);

      // if (hearAboutUsModel.status == true) {
      // Utils.showSnackBar(
      //     context, hearAboutUsModel.message.toString(), Colors.blue);
      selectBoxesHearList = globalhearAboutUsModel!.data!;
      notifyListeners();

      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) async {
      _isLoading = false;
      notifyListeners();
      throw {
        if (kDebugMode)
          {
            print(error.toString()),
          }
      };
    });
  }

  //---------------------------------
}
