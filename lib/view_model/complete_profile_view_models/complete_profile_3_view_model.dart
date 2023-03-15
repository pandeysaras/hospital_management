import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:medteam/repository/complete_profile_repo.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import '../../Utils/utils.dart';
import 'dart:io' ;
import '../../resources/app_url.dart';

class CompleteProfile3ViewModel with ChangeNotifier{
  final _myRepo = CompleteProfileRepo();

  bool _loading = false;
  bool get loading => _loading;
  late String filePath;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<File> createFileFromUint8List(Uint8List uint8list, String fileName) async {
    final directory = await getTemporaryDirectory();
    final path = '${directory.path}/$fileName';
    return await File(path).writeAsBytes(uint8list);
  }

  Future<void> postCompleteProfile3Api(Uint8List image, BuildContext context) async {

    final String fileName = 'myFile.png'; // a name for your file
    final file = await createFileFromUint8List(image, fileName);
    try {
      setLoading(true);
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer 15|RwugLsdQVMpFhdTa8H7LuRtFAS9CSSc9VYraopxy'
      };

      var request = http.MultipartRequest('POST', Uri.parse('${AppUrl.completeProfileInfo3EndPoint}'));
      request.fields.addAll({
        'user_id': "224",
      });
      if(image == null || image == "") {} else {
        request.files.add(await http.MultipartFile.fromPath('signature_file', file.path));
      }
       request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        setLoading(false);
        Utils.showSnackBar(
            context, "Step 4 Created Successfully", Colors.blue);
      }
      else {
        print(" reason${response.reasonPhrase}");
        throw Exception("Failed to create it");
      }

    } catch (error){
      setLoading(false);
      print(error.toString());
      throw Exception("Failed to create");
    }

  }



  // Future<void> postCompleteProfile3Api(dynamic data, BuildContext context) async {
  //   setLoading(true);
  //   _myRepo.completeProfile3Api(data).then((value) {
  //     setLoading(false);
  //     Utils.showSnackBar(
  //         context, value["message"], Colors.blue);
  //   }).onError((error, stackTrace) {
  //     setLoading(false);
  //     Utils.showSnackBar(
  //         context, error.toString(), Colors.red);
  //     if (kDebugMode) {
  //       print(error.toString());
  //     }
  //   });
  // }
}