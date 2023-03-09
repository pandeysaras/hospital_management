import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:medteam/Screen/BottomMenuBar.dart';
import 'package:medteam/Screen/DashBoard.dart';
import 'package:medteam/Screen/FindWork.dart';

import 'package:medteam/model/hear_about_us_model.dart';
import 'package:medteam/model/post_hear.model.dart';

import '../../Screen/EnterMobile.dart';
import '../../Utils/utils.dart';
import '../../repository/hear_about_us_repo.dart';

class PostHearAboutUSViewModel with ChangeNotifier {
  final _myRepo = HearRepository();

  String ref = " ";
  int? userID;

  bool _isChecked = false;
  bool _isLoading = false;
  bool get isChecked => _isChecked;
  bool get isLoading => _isLoading;

  @override
  void notifyListeners() {
    super.notifyListeners();
  }

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

  void postHearAboutUSWithData(
      // TextEditingController fnameController,
      // TextEditingController mnameController,
      // TextEditingController lnameController,
      BuildContext context) {
    _isLoading = true;
    notifyListeners();
    Map data = {
      "reference": ref,
      "user_id": 224,
    };
    postHearAboutUs(data, context);
  }

  // List<Data> selectBoxesHearList = [];

  Future<void> postHearAboutUs(data, BuildContext context) async {
    //-------register api call-----------//

    await _myRepo.postHearAboutUSEndpoint(data).then((value) async {
      postHearAboutModel postHearModel = postHearAboutModel.fromJson(value);

      print(value);

      // if (hearAboutUsModel.status == true) {
      Utils.showSnackBar(
          context, postHearModel.message.toString(), Colors.blue);
      // selectBoxesHearList = globalhearAboutUsModel!.data!;
      notifyListeners();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FindWork()),
      );

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
