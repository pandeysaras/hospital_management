import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medteam/model/speciality_data_model.dart';
import 'package:medteam/model/subspeciality_data_model.dart';
import 'package:medteam/repository/spec_and_subspec_data_repo.dart';

import '../Utils/utils.dart';
import '../data/response/api_response.dart';

class SpecAndSubSpecViewModel with ChangeNotifier{

  final _myRepo = SpecAndSubSpecDataRepo();


  ApiResponse<SpecialityDataModel> specialityData = ApiResponse.loading();
  ApiResponse<SubSpecialityDataModel> subSpecialityData = ApiResponse.loading();

  setSpecialityData(ApiResponse<SpecialityDataModel> response) {
    specialityData = response;
    notifyListeners();
  }

  setSubSpecialityData(ApiResponse<SubSpecialityDataModel> response) {
    subSpecialityData = response;
    notifyListeners();
  }


  Future<void> fetchSpecialityDataApi(BuildContext context) async {
    setSpecialityData(ApiResponse.loading());
    _myRepo.specialityDataApi().then((value) {
      setSpecialityData(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setSpecialityData(ApiResponse.error(error.toString()));
      print(error.toString());
    });
  }

  Future<void> fetchSubSpecialityDataApi(BuildContext context) async {
    setSubSpecialityData(ApiResponse.loading());
    _myRepo.subSpecialityDataApi().then((value) {
      setSubSpecialityData(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setSubSpecialityData(ApiResponse.error(error.toString()));
      print(error.toString());
    });
  }

}