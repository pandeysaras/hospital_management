import 'package:flutter/cupertino.dart';
import 'package:medteam/model/state_data_model.dart';
import 'package:medteam/repository/state_list_repo.dart';
import '../data/response/api_response.dart';


class StateListViewModel with ChangeNotifier {
  final _myRepo = StateListRepo();

  String _loading = "loading";
  String get loading => _loading;

  setLoading(String value) {
    _loading = value;
    notifyListeners();
  }


  ApiResponse<StateDataModel> stateList = ApiResponse.loading();


  setStateList(ApiResponse<StateDataModel> response) {
    stateList = response;
    notifyListeners();
  }



  Future<void> fetchStateList(BuildContext context) async {
    setStateList(ApiResponse.loading());
    _myRepo.stateListAPi().then((value) {
      setLoading("success");
      setStateList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setStateList(ApiResponse.error(error.toString()));
      print(error.toString());
    });
  }
}