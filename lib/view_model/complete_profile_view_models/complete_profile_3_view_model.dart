import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:medteam/repository/complete_profile_repo.dart';

import '../../Utils/utils.dart';
import '../../repository/auth_repo.dart';

class CompleteProfile3ViewModel with ChangeNotifier{
  final _myRepo = CompleteProfileRepo();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> postCompleteProfile3Api(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.completeProfile3Api(data).then((value) {
      setLoading(false);
      Utils.showSnackBar(
          context, value["message"], Colors.blue);
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}