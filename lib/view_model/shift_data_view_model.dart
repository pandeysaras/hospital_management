import 'package:flutter/cupertino.dart';
import 'package:medteam/model/shift_data_model.dart';
import 'package:medteam/repository/shift_repo.dart';

import '../data/response/api_response.dart';

class ShiftDataViewModel with ChangeNotifier{

  final _myRepo = ShiftRepo();

  ApiResponse<ShiftDataModel> shiftData = ApiResponse.loading();


  setShiftData(ApiResponse<ShiftDataModel> response) {
    shiftData = response;
    notifyListeners();
  }



  Future<void> fetchShiftDataApi(BuildContext context) async {
    setShiftData(ApiResponse.loading());
    _myRepo.shiftDataApi().then((value) {
      print(value);
      setShiftData(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setShiftData(ApiResponse.error(error.toString()));
      print(error.toString());
    });
  }

}