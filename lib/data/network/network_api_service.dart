import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiService extends BaseApiServices {
  //------------------------get api response---------------------/

  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url), headers: {
        "Accept": "application/json",
        'Authorization': 'Bearer 15|RwugLsdQVMpFhdTa8H7LuRtFAS9CSSc9VYraopxy'
      }).timeout(
        const Duration(seconds: 60),
      );

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet");
    }

    return responseJson;
  }

//-----------------------get post api response-------------------//
  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;

    try {
      Response response = await post(
        Uri.parse(url),
        body: json.encode(data),
        headers: {
          "Authorization": "Bearer 15|RwugLsdQVMpFhdTa8H7LuRtFAS9CSSc9VYraopxy",
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*",
          'Accept': '*/*',
          "content-type": "application/json",

          //------------//
        },
      ).timeout(
        const Duration(seconds: 60),
      );

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }

  //--------------------------Put api response-------------------//

  @override
  Future getPutApiResponse(String url, dynamic data) async {
    dynamic responseJson;

    try {
      Response response = await put(
        Uri.parse(url),
        body: data,
        headers: {
          //TODO: api key to be stored in server (for security)
          // "APIKey": "5567GGH67225HYVGG",
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*",
          'Accept': '*/*',
          // "content-type": "application/json"
        },
      ).timeout(
        const Duration(seconds: 60),
      );

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }

  //-----------------------------------------------------------//

  //--------------------------Delete api response-------------------//
  @override
  Future getDeleteApiResponse(String url, dynamic data) async {
    dynamic responseJson;

    try {
      Response response = await delete(
        Uri.parse(url),
        body: data,
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*",
          'Accept': '*/*',
          // "content-type": "application/json"
        },
      ).timeout(
        const Duration(seconds: 60),
      );

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(
          response.body.toString(),
        );
      case 404:
        throw UnauthorisedException(
          response.body.toString(),
        );
      default:
        throw FetchDataException(
          "Error occured while communicating with server with status code${response.statusCode}",
        );
    }
  }
}
