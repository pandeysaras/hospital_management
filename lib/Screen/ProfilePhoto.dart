import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medteam/Components/CommonButton.dart';
import 'package:medteam/Components/CommonButtonWhite.dart';
import 'package:medteam/Components/CommonButtonWithoutPadding.dart';
import 'package:medteam/Screen/CreateAccount.dart';
import 'package:medteam/Screen/SelectIndustry.dart';
import 'package:medteam/Utils/colors.dart';
import 'package:medteam/view_model/sign_up_view_models/profile_image_view_model.dart';
import 'dart:io';
import '../Utils/utils.dart';
import '../resources/app_url.dart';

class ProfilePhotoScreen extends StatefulWidget {
  @override
  _ProfilePhotoScreenState createState() => _ProfilePhotoScreenState();
}

class _ProfilePhotoScreenState extends State<ProfilePhotoScreen> {
  late double screenWidth, screenHeight;
  bool check1 = false, check2 = false, isLoading = false;
  File? profilePic;
  String? imageUrl;

  final _picker = ImagePicker();

  Future getImage(ImageSource imageSource) async {
    final pickedFile =
        await _picker.pickImage(source: imageSource, imageQuality: 80);
    if (pickedFile == null) return;
    setState(() {
      if (pickedFile != null) {
        profilePic = File(pickedFile.path);
        print(pickedFile.path);
      } else {}
    });
  }

  ProfilePicViewModel prfileViewModel = ProfilePicViewModel();

  void _toggleCheck1() {
    setState(() {
      check1 = !check1;
    });
  }

  void _toggleCheck2() {
    setState(() {
      check2 = !check2;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    ScreenUtil.init(context, designSize: Size(screenWidth, screenHeight));

    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backwardsCompatibility: false,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 0.0,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    color: white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 45.h,
                        ),
                        Container(
                          child: Image.asset(
                            'assets/describe.png',
                            width: 236.h,
                            height: 180.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 40.h),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 55, right: 55),
                                child: Text(
                                  'Let\'s work on your profile photo',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 25.sp,
                                      fontFamily: 'nunit_bold'),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(left: 20.h, right: 20.h),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: _toggleCheck1,
                                      child: Center(
                                        child: Container(
                                            width: 25.h,
                                            height: 25.h,
                                            margin: EdgeInsets.only(
                                                left: 0.h, right: 10.h),
                                            decoration: BoxDecoration(
                                                color: check1
                                                    ? Color(0xFF0075B2)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: check1
                                                    ? null
                                                    : Border.all(
                                                        color: Colors.grey)),
                                            child: Icon(
                                              Icons.check,
                                              size: 20,
                                              color: Colors.white,
                                            )),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Text(
                                          'The facility will use your profile to confirm attendance at a shift, so make sure your photo can identify who you are.',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: gray,
                                              fontSize: 14.sp,
                                              fontFamily: 'nunit_regular'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 20.h, left: 20.h, right: 20.h),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: _toggleCheck2,
                                      child: Center(
                                        child: Container(
                                            width: 25.h,
                                            height: 25.h,
                                            margin: EdgeInsets.only(
                                                left: 0.h, right: 10.h),
                                            decoration: BoxDecoration(
                                                color: check2
                                                    ? Color(0xFF0075B2)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: check2
                                                    ? null
                                                    : Border.all(
                                                        color: Colors.grey)),
                                            child: Icon(
                                              Icons.check,
                                              size: 20,
                                              color: Colors.white,
                                            )),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Text(
                                          'please make sure you use a photo of your face only. The photo should be in front of a solid light color background.',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: gray,
                                              fontSize: 14.sp,
                                              fontFamily: 'nunit_regular'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: 20.h, left: 0.h, right: 20.h),
                                  child: profilePic != null
                                      ? Image.file(
                                          profilePic!,
                                          width: 105.h,
                                          height: 105.h,
                                          fit: BoxFit.contain,
                                        )
                                      : Image.asset(
                                          'assets/user.png',
                                          width: 105.h,
                                          height: 105.h,
                                          fit: BoxFit.contain,
                                        ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 20.h, left: 15.h, right: 15.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CommonButtonWithoutPadding(
                                        label: 'TAKE A PHOTO',
                                        onPressed: () async {
                                          await getImage(ImageSource.camera);
                                        },
                                        border: 35.h,
                                        height: 38.h,
                                        fontSize: 15,
                                        textColor: white,
                                        backgroundColor: black),
                                    CommonButtonWithoutPadding(
                                        label: 'UPLOAD',
                                        onPressed: () async {
                                          await getImage(ImageSource.gallery);
                                        },
                                        border: 35.h,
                                        height: 38.h,
                                        fontSize: 15,
                                        textColor: white,
                                        backgroundColor: black),
                                  ],
                                ),
                              ),
                              SizedBox(height: 25.h),
                              Container(
                                margin:
                                    EdgeInsets.only(left: 40.h, right: 40.h),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Image.asset(
                                        'assets/back.png',
                                        width: 65.h,
                                        height: 65.h,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(right: 65.h),
                                        child: Center(
                                          child: prfileViewModel.isLoading
                                              ? CircularProgressIndicator()
                                              : CommonButtonWhite(
                                                  label: 'NEXT',
                                                  onPressed: () async {
                                                    await prfileViewModel
                                                        .updateUserProfilePic(
                                                            profilePic!,
                                                            context);
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            SelectIndustry(),
                                                      ),
                                                    );
                                                  },
                                                  border: 35.h,
                                                  height: 50.h,
                                                  fontSize: 18,
                                                  textColor: app_text_color,
                                                  backgroundColor: black),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 30.h),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
