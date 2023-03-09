import 'dart:async';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:medteam/model/profile_upload_model.dart';
import 'package:medteam/repository/profile_repo.dart';
import 'package:medteam/resources/app_url.dart';
import 'package:mime/mime.dart';
import '../../Utils/utils.dart';


//

import 'dart:convert';

import 'package:http/http.dart' as http;

class PrfileViewModel with ChangeNotifier {
  final _myRepo = ProfileRepository();
  bool _isChecked = false;
  bool _isLoading = false;
  bool get isChecked => _isChecked;
  bool get isLoading => _isLoading;

  // void setCheckBox(bool newValue) {
  //   _isChecked = newValue;
  //   if (kDebugMode) {
  //     print("isChecked $_isChecked");
  //   }
  //   notifyListeners();
  // }

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

  Future<void> updateUserProfilePic(File image, BuildContext context) async {
    try {
      setLoading();
      var request = http.MultipartRequest('POST', Uri.parse('${AppUrl.uploadProfile}'));
      request.fields.addAll({
        'user_id': "224",
      });

      if(image == null || image == "") {} else {
        request.files.add(await http.MultipartFile.fromPath('profile_picture', image.path));
      }


      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        setLoading();
        Utils.showSnackBar(
            context, "Step 4 Created Successfully", Colors.blue);
      }
      else {
print(response.reasonPhrase);
        throw Exception("Failed to create");
      }

    } catch (error){
throw Exception("Failed to create");
    }


  }


  startUploading(File fileData, int userID, BuildContext context) async {
    final Map<String, dynamic> response =
        await _uploadImage(fileData, userID, context);

    if (response == null) {
      print("address failed");
    } else {
      print("address upload successfull");
    }
  }

  _uploadImage(File fileData, int userID, BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    // String b64 = base64Encode(await fileData.readAsBytes());

    // final Map<String, dynamic> response = await _uploadImage();

    // Map data = {
    //   "profile_picture": b64,
    //   "user_id": userID,
    // };

    // String jsonEncodedData = json.encode(data);

    final mimeTypeData =
        lookupMimeType(fileData.path, headerBytes: [0xFF, 0xD8])!.split('/');

    var imageUploadrequest = http.MultipartRequest(
      'POST',
      Uri.parse(AppUrl.uploadProfile),
    );

    // // void addfile(File? imageFile) async {

    final file = await http.MultipartFile.fromPath(
      "profile_picture",
      fileData.path,
      // contentType: ContentType(mimeTypeData[0], mimeTypeData[1]),
    );

    imageUploadrequest.fields["user_id"] = 224.toString();

    try {
      final streamedResponse = await imageUploadrequest.send();
      final response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode != 200) {
        return null;
      }
      final Map<String, dynamic> responseData = json.decode(response.body);
      return responseData;
    } catch (e) {
      print(e);
      return null;
    }

    //  add(
    //     http.MultipartFile.fromBytes(
    //       'profile_picture',
    //       await fileData.readAsBytes(),

    //       filename: 'image.jpg',

    //       // contentType:
    //     ),
    //   );

    // var response = request.send();

    // if (response.hashCode == 200) {
    //   print('Form submitted successfully');
    // } else {
    //   print('Error submitting form');
    // }
    // // }
  }

//---------------------------------------------------
  // var request = http.MultipartRequest(
  //   'POST',
  //   Uri.parse('http://your-api-endpoint.com/upload'),
  // );

//------------------

  Future<void> uploadDPAPI(data, BuildContext context) async {
    //-------register api call-----------//

    await _myRepo.uploadProfilePic(data).then((value) async {
      ProfileUploadReponseModel profileUploadReponseModel =
          ProfileUploadReponseModel.fromJson(value);

      if (profileUploadReponseModel.status == true) {
        Utils.showSnackBar(
            context, profileUploadReponseModel.message.toString(), Colors.blue);

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (ctx) => EnterMobileScreen(),
        //   ),
        // );

        _isLoading = false;
        notifyListeners();
      }

      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) async {
      _isLoading = false;
      notifyListeners();
      throw {
        await Utils.showSnackBar(context, '$error', Colors.red),
        if (kDebugMode)
          {
            print(error.toString()),
          }
      };
    });
  }

  //---------------------------------
}
