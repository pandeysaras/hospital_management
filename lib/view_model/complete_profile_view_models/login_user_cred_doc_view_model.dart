import 'package:flutter/cupertino.dart';
import 'package:medteam/model/logged_in_user_credential_docurment_model.dart';
import 'package:medteam/repository/complete_profile_repo.dart';

import '../../data/response/api_response.dart';

class LoginUserCredDocViewModel with ChangeNotifier{
  final _myRepo = CompleteProfileRepo();

  ApiResponse<LoggedInUserCredentialDocumentModel> userCredDoc = ApiResponse.loading();


  setUserCredDoc(ApiResponse<LoggedInUserCredentialDocumentModel> response) {
    userCredDoc = response;
    notifyListeners();
  }



  Future<void> fetchLoginUserCredDocApi(BuildContext context) async {
    print("hey -=====================================there");
    setUserCredDoc(ApiResponse.loading());
    print("hey there");
    _myRepo.loginUserCredDocApi().then((value) {
      setUserCredDoc(ApiResponse.completed(value));
      print(value);
    }).onError((error, stackTrace) {
      setUserCredDoc(ApiResponse.error(error.toString()));
      print(error.toString());
    });
  }
}