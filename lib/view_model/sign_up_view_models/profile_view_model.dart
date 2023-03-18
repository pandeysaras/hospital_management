import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:medteam/Screen/ProfileCreated.dart';
import 'package:medteam/model/licence_list_model.dart';
import 'package:medteam/model/list_of_loaded_model.dart';
import 'package:medteam/repository/profile_repo.dart';
import 'package:medteam/resources/app_url.dart';

import '../../Screen/FindWorkBySort.dart';
import '../../Utils/utils.dart';

import 'package:http/http.dart' as http;

import '../../model/bank_details_model.dart';
import '../../model/state_list_model.dart';
import '../../model/subspeciality_data_model.dart';

class ProfileViewModel with ChangeNotifier {
  final _myRepo = ProfileRepository();
  bool _isChecked = false;
  bool _isLoading = false;
  bool get isChecked => _isChecked;
  bool get isLoading => _isLoading;

  void setLoading() {
    notifyListeners();
    if (_isLoading == true) {
      _isLoading = false;
      notifyListeners();
    } else {
      _isLoading = true;
      notifyListeners();
    }
    if (kDebugMode) {
      print(_isChecked);
    }
    notifyListeners();
  }

  Future<void> updateUserResume(
    File file,
    BuildContext context,
  ) async {
    setLoading();
    try {
      // setLoading();
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
        setLoading();
        print(response.reasonPhrase);
        throw Exception("Failed to create");
      }
    } catch (error) {
      throw Exception("Failed to create");
    }
  }

  //-------------------

  Future<void> updateLicence(
    File file,
    BuildContext context,
    String ltype,
    String state,
    String lnumber,
    String lby,
    String iDate,
    String edate,
  ) async {
    setLoading();
    try {
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
        "licence_type": ltype,
        "issued_state": state,
        "licence_number": lnumber,
        "licence_issue_date": iDate,
        "licence_expiry": edate,
        "licence_by": lby,
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
        setLoading();
        throw Exception("Failed to create");
      }
    } catch (error) {
      throw Exception("Failed to create");
    }
  }

  //bank details api
  void bankDetailsUploadlWIthData(
    BuildContext context,
    String name,
    String acno,
    String cacno,
    String racno,
  ) {
    Map data = {
      "user_id": "224",
      "account_holder_name": "$name",
      "account_status": "1",
      "account_number": "$acno",
      "confirm_account_number": "$cacno",
      "routing_account_number": "$racno",
    };

    bankDetailsUpload(data, context);
  }

  // List<Data> selectBoxesHearList = [];

  Future<void> bankDetailsUpload(data, BuildContext context) async {
    setLoading();
    //-------register api call-----------//

    await _myRepo.bankDetails(data).then((value) async {
      gloabalbankDetailsModel = BankDetailsModel.fromJson(value);

      // print(value);

      // if (hearAboutUsModel.status == true) {
      Utils.showSnackBar(context, "Bank Details Added", Colors.blue);
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
      setLoading();
    }).onError((error, stackTrace) async {
      setLoading();
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

  bool isUploaded = false;

  Future<void> documentUpload(File file, BuildContext context,
      String licseneceNo, String expdate, String issuedate) async {
    setLoading();
    try {
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
        "licence_number": "$licseneceNo",
        "licence_issue_date": "$issuedate",
        "licence_expiry": "$expdate",
      });
      // if (file == null || file == "") {
      // } else {
      request.files.add(await http.MultipartFile.fromPath('file', file.path));
      // }
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        setLoading();
        isUploaded = true;
        notifyListeners();
        Utils.showSnackBar(context, "uploaded Successfully", Colors.blue);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileCreated(),
          ),
        );
      } else {
        setLoading();
        print(response.reasonPhrase);
        isUploaded = false;
        notifyListeners();
        throw Exception("Failed to create");
      }
    } catch (error) {
      isUploaded = false;
      notifyListeners();
      setLoading();
      throw Exception("Failed to create");
    }
  }

  //--------------------licecntype--------//

  List<String> listOfLicenseTypes = [];

  Future<void> listOfLicesnesAPI(BuildContext context) async {
    //-------register api call-----------//

    await _myRepo.listOflicenseAPI().then((value) async {
      // refModel refObj = refModel.fromJson(value);
      globalLicenseListModel = LicenseListModel.fromJson(value);

      for (int i = 0; i <= globalLicenseListModel!.data!.length - 1; i++) {
        listOfLicenseTypes
            .add(globalLicenseListModel!.data![i].name.toString());
        // globalLicenseListModel!.data![i].name.toString();
        notifyListeners();
      }

      // print(value);

      // if (hearAboutUsModel.status == true) {
      // Utils.showSnackBar(context, licenseListModel.message.toString(), Colors.blue);
      // selectBoxesHearList = globalhearAboutUsModel!.data!;
      notifyListeners();

      // print(listOfLicenseTypes[1]);

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => FindWork()),
      // );

      // if (kDebugMode) {
      //   print(value.toString());
      // }
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

  //---------------------state list------------//

  List<String> listStates = [];

  Future<void> listOfStatesAPI(BuildContext context) async {
    //-------register api call-----------//

    await _myRepo.listStateAPI().then((value) async {
      // refModel refObj = refModel.fromJson(value);
      globalStateLIst = stateListMode.fromJson(value); //

      for (int i = 0; i <= globalStateLIst!.data!.length - 1; i++) {
        listStates.add(globalStateLIst!.data![i].state.toString());
        // globalLicenseListModel!.data![i].name.toString();
        notifyListeners();
      }

      // print(value);

      // if (hearAboutUsModel.status == true) {
      // Utils.showSnackBar(context, licenseListModel.message.toString(), Colors.blue);
      // selectBoxesHearList = globalhearAboutUsModel!.data!;
      notifyListeners();

      // print(listOfLicenseTypes[1]);

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => FindWork()),
      // );

      // if (kDebugMode) {
      //   print(value.toString());
      // }
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

  //-------------------------sub it
  List<String> listCerti = [];

  Future<void> subSlAPI(BuildContext context) async {
    //-------register api call-----------//

    await _myRepo.subspAPI().then((value) async {
      // refModel refObj = refModel.fromJson(value);
      globalSubSpecialityDataModel = SubSpecialityDataModel.fromJson(value); //

      for (int i = 0;
          i <= globalSubSpecialityDataModel!.data!.length - 1;
          i++) {
        listCerti.add(globalSubSpecialityDataModel!.data![i].name.toString());
        // globalLicenseListModel!.data![i].name.toString();
        notifyListeners();
      }

      // print(value);

      // if (hearAboutUsModel.status == true) {
      // Utils.showSnackBar(context, licenseListModel.message.toString(), Colors.blue);
      // selectBoxesHearList = globalhearAboutUsModel!.data!;
      notifyListeners();

      // print(listOfLicenseTypes[1]);

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => FindWork()),
      // );

      // if (kDebugMode) {
      //   print(value.toString());
      // }
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

  //------------list of uploaded docs

  List<String> listOFUploadDocs = [];

  Future<void> listOFUploadedDocAPI(BuildContext context) async {
    //-------register api call-----------//

    await _myRepo.listOfUploadedAPI().then((value) async {
      // refModel refObj = refModel.fromJson(value);
      golablListOfUploadedDataModel =
          ListOfUploadedDataModel.fromJson(value); //

      for (int i = 0;
          i <= golablListOfUploadedDataModel!.data!.length - 1;
          i++) {
        listOFUploadDocs.add(
            golablListOfUploadedDataModel!.data![i].certificateName.toString());
        // globalLicenseListModel!.data![i].name.toString();
        notifyListeners();
      }

      // print(value);

      // if (hearAboutUsModel.status == true) {
      // Utils.showSnackBar(context, licenseListModel.message.toString(), Colors.blue);
      // selectBoxesHearList = globalhearAboutUsModel!.data!;
      notifyListeners();

      // print(listOfLicenseTypes[1]);

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => FindWork()),
      // );

      // if (kDebugMode) {
      //   print(value.toString());
      // }
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
}
