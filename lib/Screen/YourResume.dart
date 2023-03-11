import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medteam/Components/CommonButton.dart';
import 'package:medteam/Components/CommonButtonWhite.dart';
import 'package:medteam/Components/CommonButtonWithPadding.dart';
import 'package:medteam/Components/CommonTextField.dart';
import 'package:medteam/Screen/AddLicense.dart';
import 'package:medteam/Screen/BottomMenuBar.dart';
import 'package:medteam/Screen/UploadLicense.dart';
import 'package:medteam/Utils/colors.dart';
import 'package:medteam/view_model/sign_up_view_models/resume_view_model.dart';
import 'package:provider/provider.dart';

class YourResume extends StatefulWidget {
  @override
  _YourResumeState createState() => _YourResumeState();
}

class _YourResumeState extends State<YourResume> {
  late double screenWidth, screenHeight;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  late TextEditingController mobile_controller;
  late FocusNode mobile_focusnode;

//----------------------
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

  //---------------------------------

  //------------------------------------

  @override
  void initState() {
    super.initState();
    mobile_controller = TextEditingController();
    mobile_focusnode = FocusNode();
  }

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
            gradient:
                LinearGradient(colors: [Color(0xFF0075B2), Color(0xFF3BA9E2)]),
          ),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  _key.currentState?.closeDrawer();
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.only(top: 35, left: 5, right: 5),
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
                  margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    'assets/user.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Container(
                  color: white,
                  padding: EdgeInsets.only(top: 20.h),
                  child: ListView(
                    // Important: Remove any padding from the ListView.
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomMenuBar(
                                      current_index: 0,
                                    )),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 8, bottom: 8),
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
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5, right: 30),
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
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomMenuBar(
                                      current_index: 1,
                                    )),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 8, bottom: 8),
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
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5, right: 30),
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
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomMenuBar(
                                      current_index: 2,
                                    )),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 8, bottom: 8),
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
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5, right: 30),
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
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomMenuBar(
                                      current_index: 3,
                                    )),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 8, bottom: 8),
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
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5, right: 30),
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
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
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
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5, right: 30),
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
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
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
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5, right: 30),
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
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
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
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5, right: 30),
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
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
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
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5, right: 30),
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
                      SizedBox(
                        height: 20,
                      ),
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
                          height: 18.h,
                          margin:
                              EdgeInsets.only(left: 20.h, top: 0.h, right: 0.h),
                          padding: EdgeInsets.only(left: 3, right: 3),
                          child: Center(
                              child: Image.asset(
                            'assets/green_check_icon.png',
                          )),
                        ),
                        Container(
                          height: 18.h,
                          margin:
                              EdgeInsets.only(left: 10.h, top: 0.h, right: 0.h),
                          padding: EdgeInsets.only(left: 3, right: 3),
                          child: Center(
                              child: Image.asset(
                            'assets/green_check_icon.png',
                          )),
                        ),
                        Container(
                          height: 18.h,
                          decoration: BoxDecoration(
                            color: gradient_color_light,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: gradient_color_light, width: 1),
                          ),
                          margin: EdgeInsets.only(
                              left: 10.h, top: 0.h, right: 10.h),
                          padding: EdgeInsets.only(left: 3, right: 3),
                          child: Center(
                            child: Text(
                              '3',
                              style: TextStyle(
                                color: white,
                                fontSize: 12.sp,
                                fontFamily: 'nunit_bold',
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Your Resume',
                          style: TextStyle(
                            color: black,
                            fontSize: 16.sp,
                            fontFamily: 'nunit_bold',
                          ),
                        ),
                        Container(
                          height: 18.h,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: gradient_color_light, width: 1),
                          ),
                          margin: EdgeInsets.only(
                              left: 10.h, top: 0.h, right: 10.h),
                          padding: EdgeInsets.only(left: 3, right: 3),
                          child: Center(
                            child: Text(
                              '4',
                              style: TextStyle(
                                color: gradient_color_light,
                                fontSize: 12.sp,
                                fontFamily: 'nunit_bold',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 18.h,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: gradient_color_light, width: 1),
                          ),
                          margin: EdgeInsets.only(
                              left: 10.h, top: 0.h, right: 10.h),
                          padding: EdgeInsets.only(left: 3, right: 3),
                          child: Center(
                            child: Text(
                              '5',
                              style: TextStyle(
                                color: gradient_color_light,
                                fontSize: 12.sp,
                                fontFamily: 'nunit_bold',
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
                      height: 10,
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
                              margin: EdgeInsets.only(left: 20.h, right: 20.w),
                              child: TextField(
                                  maxLines: 1,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.done,
                                  obscureText: true,
                                  autofocus: false,
                                  enabled: true,
                                  cursorColor: black,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: black,
                                    fontFamily: "nunit_regular",
                                  ),
                                  controller: mobile_controller,
                                  focusNode: mobile_focusnode,
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
                                    hintText: "Extra Certificate",
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
                                            'assets/down_arrow.png',
                                            color: black,
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
                                'Upload your Resume',
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
                      height: 15.h,
                    ),
                    Text(
                      'View',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: black,
                          fontSize: 20.sp,
                          fontFamily: 'nunit_bold'),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 40.h, right: 40.h),
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
                                CommonButton(
                                    label: 'NEXT',
                                    onPressed: () async {
                                      await context
                                          .read<UploadFilesViewModel>()
                                          .updateUserResume(file!, context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => UploadLicense(),
                                        ),
                                      );
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
