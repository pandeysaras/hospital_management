import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../Utils/utils.dart';
import '../../repository/auth_repo.dart';

class SelectSkillSetSubcatViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();

  Future<void> postSelectSkillSetApi(dynamic data, BuildContext context) async {
    _authRepo.selectSkillSetApi(data).then((value) {
      Utils.showSnackBar(
          context, "Step 6 Created Successfully", Colors.blue);
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> postSelectSubCatSkillSetApi(dynamic data, BuildContext context) async {
    _authRepo.selectSkillSetSubCatApi(data).then((value) {
      Utils.showSnackBar(
          context, "Step 7 Created Successfully", Colors.blue);
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }


}