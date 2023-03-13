import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medteam/Components/CommonButton.dart';
import 'package:medteam/Components/CommonButtonWhite.dart';
import 'package:medteam/Components/CommonButtonWithPadding.dart';
import 'package:medteam/Components/CommonTextField.dart';
import 'package:medteam/Screen/FindWorkBySort.dart';
import 'package:medteam/Utils/colors.dart';
import 'package:medteam/view_model/sign_up_view_models/profile_view_model.dart';
import 'dart:math';

import 'package:provider/provider.dart';

class UploadedDocuments extends StatefulWidget {
  @override
  _UploadedDocumentsState createState() => _UploadedDocumentsState();
}

class _UploadedDocumentsState extends State<UploadedDocuments> {
  late double screenWidth, screenHeight;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  late TextEditingController mobile_controller;
  late FocusNode mobile_focusnode;
  String gender = "male";

  @override
  void initState() {
    super.initState();
    mobile_controller = TextEditingController();
    mobile_focusnode = FocusNode();
  }

  //---------------upload-------------
  File? file;

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      print("---------------------picked");
      file = File(
        result.files.single.path!,
      );
    } else {
      print("No pi");
      // User canceled the picker
    }
  }

  //---------------------------

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    ScreenUtil.init(context, designSize: Size(screenWidth, screenHeight));

    return Scaffold(
      key: _key,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
          title: Text(
            'Credential Documents',
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
                'assets/back_arrow.png',
                color: white,
              ),
            ),
          )),
      body: SafeArea(
        child: Container(
          color: white,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Container(
                            height: 18.h,
                            margin: EdgeInsets.only(
                                left: 20.h, top: 0.h, right: 10.h),
                            padding: EdgeInsets.only(left: 3, right: 3),
                            child: Center(
                                child: Image.asset(
                              'assets/green_check_icon.png',
                            )),
                          ),
                          Expanded(
                            child: Text(
                              'Uploaded Credentials',
                              style: TextStyle(
                                color: black,
                                fontSize: 16.sp,
                                fontFamily: 'nunit_bold',
                              ),
                            ),
                          ),
                          Container(
                            height: 18.h,
                            margin: EdgeInsets.only(
                                left: 20.h, top: 0.h, right: 10.h),
                            padding: EdgeInsets.only(left: 3, right: 3),
                            child: Center(
                                child: Transform.rotate(
                              angle: 180 * pi / 180,
                              child: Image.asset(
                                'assets/back_arrow.png',
                              ),
                            )),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Divider(
                        color: black,
                      ),
                      SizedBox(height: 15),
                      Center(
                          child: Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Image.asset(
                          'assets/resume.png',
                          width: 236.h,
                          height: 180.h,
                          fit: BoxFit.contain,
                        ),
                      )),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(top: 20.h, left: 30.h, right: 30.h),
                        child: CommonTextField(
                            thecontroller: mobile_controller,
                            label: "License Number",
                            type: TextInputType.text,
                            action: TextInputAction.done,
                            lines: 1,
                            secure: false,
                            focusChange: () {
                              // mobile_focusnode.unfocus();
                            },
                            fontSize: 18.sp,
                            focusNode: mobile_focusnode,
                            text_color: black,
                            hint_color: gray),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(top: 20.h, left: 30.h, right: 30.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: black, width: 1),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin:
                                    EdgeInsets.only(left: 20.h, right: 20.w),
                                child: TextField(
                                    autofocus: false,
                                    enabled: false,
                                    cursorColor: black,
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      color: black,
                                      fontFamily: "nunit_regular",
                                    ),
                                    onEditingComplete: () {
                                      // focusChange();
                                    },
                                    decoration: InputDecoration(
                                      focusedBorder: border,
                                      border: border,
                                      enabledBorder: border,
                                      disabledBorder: border,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0.0, horizontal: 10.0),
                                      hintText: "Issuing or Test Date",
                                      hintStyle: TextStyle(
                                        fontSize: 18.sp,
                                        color: gray,
                                        fontFamily: "nunit_regular",
                                      ),
                                      suffixIconConstraints: BoxConstraints(
                                          maxHeight: 20, maxWidth: 30),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          //loginController.pass_secure.value = !loginController.pass_secure.value;
                                        },
                                        child: Padding(
                                            padding: EdgeInsets.only(right: 5),
                                            child: Image.asset(
                                              'assets/calender.png',
                                            )),
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(top: 20.h, left: 30.h, right: 30.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: black, width: 1),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin:
                                    EdgeInsets.only(left: 20.h, right: 20.w),
                                child: TextField(
                                    autofocus: false,
                                    enabled: false,
                                    cursorColor: black,
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      color: black,
                                      fontFamily: "nunit_regular",
                                    ),
                                    onEditingComplete: () {
                                      // focusChange();
                                    },
                                    decoration: InputDecoration(
                                      focusedBorder: border,
                                      border: border,
                                      enabledBorder: border,
                                      disabledBorder: border,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0.0, horizontal: 10.0),
                                      hintText: "Expiration Date(Optional)",
                                      hintStyle: TextStyle(
                                        fontSize: 18.sp,
                                        color: gray,
                                        fontFamily: "nunit_regular",
                                      ),
                                      suffixIconConstraints: BoxConstraints(
                                          maxHeight: 20, maxWidth: 30),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          //loginController.pass_secure.value = !loginController.pass_secure.value;
                                        },
                                        child: Padding(
                                            padding: EdgeInsets.only(right: 5),
                                            child: Image.asset(
                                              'assets/calender.png',
                                            )),
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Container(
                        height: 50.h,
                        decoration: new BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3.0,
                              ),
                            ],
                            gradient: LinearGradient(
                                colors: [Color(0xFF0075B2), Color(0xFF3BA9E2)]),
                            borderRadius: BorderRadius.circular(35)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15, right: 0),
                              height: 30.h,
                              width: 30.h,
                              child: Image.asset(
                                'assets/round_up_arrow.png',
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  shadowColor: Colors.transparent),
                              onPressed: () {
                                pickFile();
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 0, right: 15),
                                child: Text(
                                  'Upload Documents',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: white,
                                      fontSize: 18,
                                      fontFamily: 'nunit_extrabold',
                                      shadows: <Shadow>[
                                        Shadow(
                                          blurRadius: 10.0,
                                          color: Colors.black,
                                          offset: Offset(3.0, 3.0),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      CommonButton(
                          label: 'DONE',
                          onPressed: () async {
                            context
                                .read<profileViewModel>()
                                .documentUpload(file!, context);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (cont ext) => FindWorkBySort(),
                            //   ),
                            // );
                          },
                          border: 35.h,
                          height: 50.h,
                          fontSize: 18,
                          textColor: white,
                          backgroundColor: black),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
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
