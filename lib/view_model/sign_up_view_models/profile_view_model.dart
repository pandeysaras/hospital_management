import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:medteam/repository/profile_repo.dart';
import 'package:medteam/resources/app_url.dart';

import '../../Utils/utils.dart';

import 'package:http/http.dart' as http;

import '../../model/bank_details_model.dart';

class profileViewModel with ChangeNotifier {
  final _myRepo = ProfileRepository();
  bool _isChecked = false;
  bool _isLoading = false;
  bool get isChecked => _isChecked;
  bool get isLoading => _isLoading;

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

  Future<void> updateUserResume(File file, BuildContext context) async {
    try {
      setLoading();
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(AppUrl.uploadResumeEndPoint),
      );

      // Add headers to the request
      request.headers['Authorization'] =
          'Bearer 15|RwugLsdQVMpFhdTa8H7LuRtFAS9CSSc9VYraopxy';
      request.headers['Content-Type'] = 'multipart/form-data';
      request.headers['Accept'] = 'application/json';

      request.fields.addAll({
        'user_id': "224",
        "certificate_id": "20",
        "certificate_name": "somename",
      });
      // if (file == null || file == "") {
      // } else {
      request.files.add(await http.MultipartFile.fromPath('file', file.path));
      // }
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        setLoading();
        Utils.showSnackBar(context, "uploaded Successfully", Colors.blue);
      } else {
        print(response.reasonPhrase);
        throw Exception("Failed to create");
      }
    } catch (error) {
      throw Exception("Failed to create");
    }
  }

  //-------------------

  Future<void> updateLicence(File file, BuildContext context) async {
    try {
      setLoading();
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(AppUrl.uploadLicence),
      );

      // Add headers to the request
      request.headers['Authorization'] =
          'Bearer 15|RwugLsdQVMpFhdTa8H7LuRtFAS9CSSc9VYraopxy';

      request.headers['Content-Type'] = 'multipart/form-data';
      request.headers['Accept'] = 'application/json';

      request.fields.addAll({
        'user_id': "224",
        "licence_name": "Government Issued ID",
        "licence_id": "20",
        "licence_type": "MS Licence",
        "issued_state": "LA",
        "licence_number": "225533333",
        "licence_issue_date": "2014-2-12",
        "licence_expiry": "2014-3-12",
        "licence_by": "USA ",
        "licence_standard": "1",
      });
      // if (file == null || file == "") {
      // } else {
      request.files.add(await http.MultipartFile.fromPath('file', file.path));
      // }
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        setLoading();
        Utils.showSnackBar(context, "uploaded Successfully", Colors.blue);
      } else {
        print(response.reasonPhrase);
        throw Exception("Failed to create");
      }
    } catch (error) {
      throw Exception("Failed to create");
    }
  }

  //bank details api
  void bankDetailsUploadlWIthData(BuildContext context) {
    _isLoading = true;
    notifyListeners();
    Map data = {
      "user_id": "224",
      "account_holder_name": "Karl",
      "account_status": "1",
      "account_number": "1122333222",
      "confirm_account_number": "1122333222",
      "routing_account_number": "112233322222"
    };
    bankDetailsUpload(data, context);
  }

  // List<Data> selectBoxesHearList = [];

  Future<void> bankDetailsUpload(data, BuildContext context) async {
    //-------register api call-----------//

    await _myRepo.bankDetails(data).then((value) async {
      gloabalbankDetailsModel = BankDetailsModel.fromJson(value);
      Navigator.of(context).pop();
      // print(value);

      // if (hearAboutUsModel.status == true) {
      Utils.showSnackBar(
          context, gloabalbankDetailsModel!.message.toString(), Colors.blue);
      // selectBoxesHearList = globalhearAboutUsModel!.data!;
      notifyListeners();
      // print("------------- ${gloabalbankDetailsModel!.status.toString()}");
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => FindWork()),
      // );

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

//------------doc upload

  Future<void> documentUpload(File file, BuildContext context) async {
    try {
      setLoading();
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(AppUrl.documetnsUplaoadEndpoint),
      );

      // Add headers to the request
      request.headers['Authorization'] =
          'Bearer 15|RwugLsdQVMpFhdTa8H7LuRtFAS9CSSc9VYraopxy';

      request.headers['Content-Type'] = 'multipart/form-data';
      request.headers['Accept'] = 'application/json';

      request.fields.addAll({
        'user_id': "224",
        "document_id": "Government Issued ID",
        "document_name": "20",
        "licence_number": "225533333",
        "licence_issue_date": "2014-2-12",
        "licence_expiry": "2014-3-12",
      });
      // if (file == null || file == "") {
      // } else {
      request.files.add(await http.MultipartFile.fromPath('file', file.path));
      // }
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        setLoading();
        Utils.showSnackBar(context, "uploaded Successfully", Colors.blue);
      } else {
        print(response.reasonPhrase);
        throw Exception("Failed to create");
      }
    } catch (error) {
      throw Exception("Failed to create");
    }
  }
}
