import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medteam/Components/CommonButton.dart';
import 'package:medteam/Components/CommonButtonWhite.dart';
import 'package:medteam/Components/CommonButtonWithPadding.dart';
import 'package:medteam/Components/CommonTextField.dart';
import 'package:medteam/Screen/BottomMenuBar.dart';
import 'package:medteam/Screen/YourResume.dart';
import 'package:medteam/Utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';

import '../view_model/complete_profile_view_models/complete_profile_3_view_model.dart';

class SignatureCapture extends StatefulWidget {
  @override
  _SignatureCaptureState createState() => _SignatureCaptureState();
}

class _SignatureCaptureState extends State<SignatureCapture> {
  late double screenWidth, screenHeight;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  late TextEditingController mobile_controller;
  late FocusNode mobile_focusnode;

  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

// INITIALIZE. RESULT IS A WIDGET, SO IT CAN BE DIRECTLY USED IN BUILD METHOD



  @override
  void initState() {
    super.initState();
    _controller.addListener(() { });
    mobile_controller = TextEditingController();
    mobile_focusnode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // final Uint8List? data =
  //     await _controller.toPngBytes(height: 1000, width: 1000);
  // if (data == null) {
  // return;
  // }

  @override
  Widget build(BuildContext context) {
    final completeProfile3VM = Provider.of<CompleteProfile3ViewModel>(context);
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    ScreenUtil.init(context, designSize: Size(screenWidth, screenHeight));

    var _signatureCanvas = Signature(
      controller: _controller,
      width: screenWidth,
      height: screenHeight/2.5,
      backgroundColor: Colors.white,
    );

    return Scaffold(
      key: _key,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
          title: Text(
            'Profile Info',
            style: TextStyle(color: white, fontFamily: 'nunit_bold'),
          ),
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              _key.currentState!.openDrawer();
            },
            child: Container(
              padding: EdgeInsets.only(right: 10, left: 10, top: 4),
              child: Image.asset(
                'assets/drawer_icon.png',
                fit: BoxFit.fill,
              ),
            ),
          )),
      drawer: Drawer(
        child: Container(
          decoration: new BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xFF0075B2),Color(0xFF3BA9E2)]),
          ),
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  _key.currentState?.closeDrawer();
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.only(top:35,left: 5,right: 5),
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      'assets/cancel.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              ClipRect(
                child: Container(
                  margin: EdgeInsets.only(top:5,left: 5,right: 5),
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    'assets/user.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Expanded(
                child: Container(
                  color: white,
                  padding: EdgeInsets.only(top: 20.h),
                  child: ListView(
                    // Important: Remove any padding from the ListView.
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      InkWell(
                        onTap:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BottomMenuBar(current_index: 0,)),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.only(top:8,bottom: 8),
                          margin: EdgeInsets.only(right: 30),
                          decoration: BoxDecoration(
                            color: color_box_bg_gray,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 15,),
                              Container(
                                margin: EdgeInsets.only(left: 5,right: 30),
                                height: 35,
                                width: 35,
                                child: Image.asset(
                                  'assets/dashboard_bottom.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Text(
                                      'Dash Board',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: black,
                                          fontSize: 15.sp,
                                          fontFamily: 'nunit_extrabold'),

                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BottomMenuBar(current_index: 1,)),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.only(top:8,bottom: 8),
                          margin: EdgeInsets.only(right: 30),
                          decoration: BoxDecoration(
                            color: color_box_bg_gray,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 15,),
                              Container(
                                margin: EdgeInsets.only(left: 5,right: 30),
                                height: 35,
                                width: 35,
                                child: Image.asset(
                                  'assets/time_black.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Text(
                                      'Time Clock',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: black,
                                          fontSize: 15.sp,
                                          fontFamily: 'nunit_extrabold'),

                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 15,),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BottomMenuBar(current_index: 2,)),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.only(top:8,bottom: 8),
                          margin: EdgeInsets.only(right: 30),
                          decoration: BoxDecoration(
                            color: color_box_bg_gray,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 15,),
                              Container(
                                margin: EdgeInsets.only(left: 5,right: 30),
                                height: 35,
                                width: 35,
                                child: Image.asset(
                                  'assets/schedule_black.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Text(
                                      'My Schedule',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: black,
                                          fontSize: 15.sp,
                                          fontFamily: 'nunit_extrabold'),

                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BottomMenuBar(current_index: 3,)),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.only(top:8,bottom: 8),
                          margin: EdgeInsets.only(right: 30),
                          decoration: BoxDecoration(
                            color: color_box_bg_gray,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 15,),
                              Container(
                                margin: EdgeInsets.only(left: 5,right: 30),
                                height: 35,
                                width: 35,
                                child: Image.asset(
                                  'assets/profile_black.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Text(
                                      'My Profile',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: black,
                                          fontSize: 15.sp,
                                          fontFamily: 'nunit_extrabold'),

                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 15,),
                      Container(
                        padding: EdgeInsets.only(top:8,bottom: 8),
                        margin: EdgeInsets.only(right: 30),
                        decoration: BoxDecoration(
                          color: color_box_bg_gray,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 15,),
                            Container(
                              margin: EdgeInsets.only(left: 5,right: 30),
                              height: 35,
                              width: 35,
                              child: Image.asset(
                                'assets/support.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Text(
                                    'Support',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 15.sp,
                                        fontFamily: 'nunit_extrabold'),

                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 15,),
                      Container(
                        padding: EdgeInsets.only(top:8,bottom: 8),
                        margin: EdgeInsets.only(right: 30),
                        decoration: BoxDecoration(
                          color: color_box_bg_gray,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 15,),
                            Container(
                              margin: EdgeInsets.only(left: 5,right: 30),
                              height: 35,
                              width: 35,
                              child: Image.asset(
                                'assets/invite.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Text(
                                    'Invite Friends',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 15.sp,
                                        fontFamily: 'nunit_extrabold'),

                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 15,),
                      Container(
                        padding: EdgeInsets.only(top:8,bottom: 8),
                        margin: EdgeInsets.only(right: 30),
                        decoration: BoxDecoration(
                          color: color_box_bg_gray,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 15,),
                            Container(
                              margin: EdgeInsets.only(left: 5,right: 30),
                              height: 35,
                              width: 35,
                              child: Image.asset(
                                'assets/msg.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Text(
                                    'Message Facility',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 15.sp,
                                        fontFamily: 'nunit_extrabold'),

                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 15,),
                      Container(
                        padding: EdgeInsets.only(top:8,bottom: 8),
                        margin: EdgeInsets.only(right: 30),
                        decoration: BoxDecoration(
                          color: color_box_bg_gray,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 15,),
                            Container(
                              margin: EdgeInsets.only(left: 5,right: 30),
                              height: 35,
                              width: 35,
                              child: Image.asset(
                                'assets/setting.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Text(
                                    'Settings',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 15.sp,
                                        fontFamily: 'nunit_extrabold'),

                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: white,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Container(
                          height:18.h,
                          margin: EdgeInsets.only(
                              left: 20.h, top: 0.h,right: 0.h),
                          padding: EdgeInsets.only(left: 3,right: 3),
                          child:  Center(
                              child: Image.asset(
                                'assets/green_check_icon.png',
                              )
                          ),

                        ),
                        Container(
                          height:18.h,
                          decoration: BoxDecoration(
                            color: gradient_color_light,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: gradient_color_light, width: 1),
                          ),
                          margin: EdgeInsets.only(
                              left: 10.h, top: 0.h,right: 10.h),
                          padding: EdgeInsets.only(left: 3,right: 3),
                          child:  Center(
                            child: Text(
                              '2',
                              style: TextStyle(
                                color: white,
                                fontSize: 12.sp,
                                fontFamily:
                                'nunit_bold',
                              ),
                            ),
                          ),

                        ),
                        Text(
                          'W9 Form Submission',
                          style: TextStyle(
                            color: black,
                            fontSize: 16.sp,
                            fontFamily:
                            'nunit_bold',
                          ),
                        ),
                        Container(
                          height:18.h,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: gradient_color_light, width: 1),
                          ),
                          margin: EdgeInsets.only(
                              left: 10.h, top: 0.h,right: 10.h),
                          padding: EdgeInsets.only(left: 3,right: 3),
                          child:  Center(
                            child: Text(
                              '3',
                              style: TextStyle(
                                color: gradient_color_light,
                                fontSize: 12.sp,
                                fontFamily:
                                'nunit_bold',
                              ),
                            ),
                          ),

                        ),

                        Container(
                          height:18.h,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: gradient_color_light, width: 1),
                          ),
                          margin: EdgeInsets.only(
                              left: 10.h, top: 0.h,right: 10.h),
                          padding: EdgeInsets.only(left: 3,right: 3),
                          child:  Center(
                            child: Text(
                              '4',
                              style: TextStyle(
                                color: gradient_color_light,
                                fontSize: 12.sp,
                                fontFamily:
                                'nunit_bold',
                              ),
                            ),
                          ),

                        ),
                        Container(
                          height:18.h,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: gradient_color_light, width: 1),
                          ),
                          margin: EdgeInsets.only(
                              left: 10.h, top: 0.h,right: 10.h),
                          padding: EdgeInsets.only(left: 3,right: 3),
                          child:  Center(
                            child: Text(
                              '5',
                              style: TextStyle(
                                color: gradient_color_light,
                                fontSize: 12.sp,
                                fontFamily:
                                'nunit_bold',
                              ),
                            ),
                          ),

                        ),


                      ],
                    ),
                    SizedBox(height: 8),
                    Divider(
                      color: black,
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 40,right: 40,top: 10,bottom: 20),
                      child: Text(
                        'Signature Capture',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: black,
                            fontSize: 25.sp,
                            fontFamily: 'nunit_bold'),
                      ),
                    ),
                   /*Container(
                      child: Image.asset(
                        'assets/map.png',
                        width: screenWidth,
                        height: screenHeight/3,
                        fit: BoxFit.fill,
                      ),
                    ),*/
                    _signatureCanvas,
                    GestureDetector(
                      onTap: () {
                        _controller.clear();
                      },
                      child: Text(
                        'CLEAR',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: app_text_color,
                            fontSize: 25.sp,
                            fontFamily: 'nunit_bold'),
                      ),
                    ),

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          // SizedBox(height: 30,),

                          Container(
                            margin: EdgeInsets.only(left: 40.h,right: 40.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonButtonWhite(
                                    label: 'PREV',
                                    onPressed: () async {},
                                    border: 35.h,
                                    height: 50.h,
                                    fontSize: 18,
                                    textColor: app_text_color,
                                    backgroundColor: black),
                               completeProfile3VM.loading ? CircularProgressIndicator() : CommonButton(
                                    label: 'NEXT',
                                    onPressed: () async {
                                      try{
                                        final Uint8List? imageFile =
                                        await _controller.toPngBytes();

                                        print("=================================${imageFile}=============");
                                        // File file = File.fromRawPath(imageFile!);
                                        // await file.writeAsBytes(imageFile);
                                        print("======================================${Image.memory(imageFile!)}");
                                        completeProfile3VM.postCompleteProfile3Api(imageFile, context);
                                      } catch(e) {
                                        print(e.toString());
                                      }

                                      // Map data = {
                                      //   "user_id" :   224,
                                      //   "signature_file" : imageFile
                                      // };
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                          builder: (context) => YourResume()));
                                    },
                                    border: 35.h,
                                    height: 50.h,
                                    fontSize: 18,
                                    textColor: white,
                                    backgroundColor: black),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final border = UnderlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide.none,
  );
}
