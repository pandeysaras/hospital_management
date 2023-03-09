import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:medteam/model/industry_data_model.dart';
import 'package:medteam/model/speciality_data_model.dart';
import 'package:medteam/model/subspeciality_data_model.dart';
import 'package:medteam/repository/auth_repo.dart';
import 'package:medteam/repository/industry_data_repo.dart';
import 'package:medteam/repository/spec_and_subspec_data_repo.dart';

import '../../Utils/utils.dart';
import '../../data/response/api_response.dart';

class IndustryDataViewModel with ChangeNotifier{

  final _myRepo = IndustryDataRepo();
  final _authRepo = AuthRepository();


  ApiResponse<IndustryDataModel> industryData = ApiResponse.loading();


  setIndustryData(ApiResponse<IndustryDataModel> response) {
    industryData = response;
    notifyListeners();
  }



  Future<void> fetchIndustryDataApi(BuildContext context) async {
    setIndustryData(ApiResponse.loading());
    _myRepo.industryDataApi().then((value) {
      setIndustryData(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setIndustryData(ApiResponse.error(error.toString()));
      print(error.toString());
    });
  }

  Future<void> postSelectIndustryApi(dynamic data, BuildContext context) async {
    _authRepo.selectIndustryApi(data).then((value) {
      print("sccdfssssss $value");
      Utils.showSnackBar(
          context, "Step 5 Created Successfully", Colors.blue);

    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }


}