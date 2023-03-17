import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:medteam/repository/shift_repo.dart';

import '../Utils/utils.dart';

class BidShiftViewModel with ChangeNotifier{
  final _authRepo = ShiftRepo();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> postBidShiftApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _authRepo.bidShiftAPi(data).then((value) {
      setLoading(false);
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => FindWork()));
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