import 'package:flutter/cupertino.dart';
import 'package:medteam/model/state_data_model.dart';
import 'package:medteam/repository/state_list_repo.dart';
import '../data/response/api_response.dart';


class StateListViewModel with ChangeNotifier {
  final _myRepo = StateListRepo();
  List<States> states =[];
  int id = 0;

  String? chooseState;
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
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
    setLoading(true);
    _myRepo.stateListAPi().then((value) {
      setLoading(false);
      setStateList(ApiResponse.completed(value));
      states = stateList.data!.states!;
    }).onError((error, stackTrace) {
      setLoading(false);
      setStateList(ApiResponse.error(error.toString()));
      print(error.toString());
    });
  }


  void chooseStateFunc(String newValue){
    chooseState = newValue;
    id=states.firstWhere((element) => element.state == newValue).id! ;
    notifyListeners();
  }

  void clearValue(){
    chooseState = null;
    notifyListeners();
  }
}