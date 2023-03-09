// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/material.dart';

// import 'package:shared_preferences/shared_preferences.dart';

// import 'dart:async';
// import 'dart:io';
// import 'dart:ui';


// import '../Constant.dart';

// class ApiCalling2 {
//   String? userIdPref, token;
//   Response? response;
//   BuildContext? context;
//   String ?uri;
//   String ?type;


//   Future<Response?> apiCallWithAuthToken(context1,url,type) async {
//     context = context1;
//     response = await apiCallingAuthToken(url,type);
//     return response;
//   }
//   Future<Response?> apiCallingAuthToken(url,type) async {
  
//       try {

//         var dio =  Dio();


//         dio.options.baseUrl = Constant.BASE_URL;
//         dio.options.connectTimeout = Constant.CONNECTION_TIME_OUT; //5s
//         dio.options.receiveTimeout = Constant.SERVICE_TIME_OUT;
//         dio.options.headers = {'user-agent': 'dio'};
//         dio.options.headers = {'Accept': 'application/json'};
//         dio.options.headers = {'Content-Type': 'application/json'};
//         dio.options.headers = {'Authorization': token}; // Prepare Data

//         // Make API call
//         if(type=='get') {
//           response = await dio.get(url);
//         }else{
//           response = await dio.post(url);

//         }
//         print("LoaderCancel+++"+response.toString());
//         if (response?.statusCode == 200) {

//             return response;

//         } else {
//           //  CustomProgressLoader.cancelLoader(context);
//           print("LoaderCancel+++ false");
//           return response;
//         }
//       } catch (e) {
//         print("LoaderCancel+++"+e.toString());
//         print(e);
//         return response;
//       }
  
//   }

//   //Api calling without loader and auth token
//   Future<Response?> apiCallWithouAuth(context1,url,type) async {
//     context = context1;
//     response = await apiCallingWithoutAuth(url,type);
//     return response;
//   }
//   Future<Response?> apiCallingWithoutAuth(url,type) async {

//       try {

//         var dio =  Dio();
       

//         dio.options.baseUrl = Constant.BASE_URL;
//         dio.options.connectTimeout = Constant.CONNECTION_TIME_OUT; //5s
//         dio.options.receiveTimeout = Constant.SERVICE_TIME_OUT;
//         dio.options.headers = {'user-agent': 'dio'};
//         dio.options.headers = {'Accept': 'application/json'};
//         dio.options.headers = {'Content-Type': 'application/json'};
//         //   dio.options.headers = {'Authorization': token}; // Prepare Data

//         // Make API call
//         if(type=='get') {
//           response = await dio.get(url);
//         }else{
//           response = await dio.post(url);

//         }
//         //CustomProgressLoader.cancelLoader(context);
//         print("LoaderCancel+++"+response.toString());
//         if (response?.statusCode == 200) {

      
//             return response;
         
//         } else {
//           //  CustomProgressLoader.cancelLoader(context);
//           print("LoaderCancel+++ false");
//           return response;
//         }
//       } catch (e) {
//         print("LoaderCancel+++"+e.toString());
//         //CustomProgressLoader.cancelLoader(context);
//         print(e);
//         return response;
//       }

//   }


 
//   //============================================Api Calling post with Param ===============================

//   Future<Response?> apiCallPostWithMapData(context1, url, map) async {
//     context = context1;
//     response = await apiCallPost(url, map);
//     return response;
//   }

//   Future<Response?> apiCallPost(url, map) async {
  
//       try {
      
//         var dio =  Dio();
//        dio.options.baseUrl = Constant.BASE_URL;
//         dio.options.connectTimeout = Constant.CONNECTION_TIME_OUT;
//         dio.options.receiveTimeout = Constant.SERVICE_TIME_OUT;
//         dio.options.headers = {'user-agent': 'dio'};
//         dio.options.headers = {'Accept': 'application/json'};
//         dio.options.headers = {'Content-Type': 'application/json'};

//         response = await dio.post(url, data: json.encode(map));

//         print("response:-" + response.toString());

//         print(response.toString());
//         if (response?.statusCode == 200) {

//             return response;
         
//         } else {
//           return response;
//         }
//       } catch (e) {
//         print(e);
//         return response;
//       }
    
//   }

//   //============================================Api Calling put with Param ===============================

//   Future<Response?> apiCallPutWithMapData(context1, url, map) async {
//     context = context1;
//     response = await apiCallPut(url, map);
//     return response;
//   }

//   Future<Response?> apiCallPut(url, map) async {
   
//       try {
       
//         var dio =  Dio();


//         dio.options.baseUrl = Constant.BASE_URL;
//         dio.options.connectTimeout = Constant.CONNECTION_TIME_OUT; //5s
//         dio.options.receiveTimeout = Constant.SERVICE_TIME_OUT;
//         dio.options.headers = {'user-agent': 'dio'};
//         dio.options.headers = {'Accept': 'application/json'};
//         dio.options.headers = {'Content-Type': 'application/json'};
//         dio.options.headers = {'Authorization': token}; // Prepare Data

//         response = await dio.put(url, data: json.encode(map));

//         print("response:-" + response.toString());

//         print(response.toString());
//         if (response?.statusCode == 200) {
         
//             return response;
         
//         } else {
//           return response;
//         }
//       } catch (e) {
//         print(e);
//         return response;
//       }
   
//   }

//   //============================================Api Calling Delete with Param ===============================

//   Future<Response?> apiCallDeleteWithMapData(context1, url, map) async {
//     context = context1;
//     response = await apiCallDelete(url, map);
//     return response;
//   }

//   Future<Response?> apiCallDelete(url, map) async {

//       try {

//         var dio =  Dio();


//         dio.options.baseUrl = Constant.BASE_URL;
//         dio.options.connectTimeout = Constant.CONNECTION_TIME_OUT; //5s
//         dio.options.receiveTimeout = Constant.SERVICE_TIME_OUT;
//         dio.options.headers = {'user-agent': 'dio'};
//         dio.options.headers = {'Accept': 'application/json'};
//         dio.options.headers = {'Content-Type': 'application/json'};
//         dio.options.headers = {'Authorization': token}; // Prepare Data

//         response = await dio.delete(url, data: json.encode(map));

//         print("response:-" + response.toString());

//         print(response.toString());
//         if (response?.statusCode == 200) {

//             return response;

//         } else {
//           return response;
//         }
//       } catch (e) {
//         print(e);
//         return response;
//       }

//   }
// }
