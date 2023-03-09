import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medteam/Components/CommonButton.dart';
import 'package:medteam/Components/CommonButtonWhite.dart';
import 'package:medteam/Components/CommonButtonWithPadding.dart';
import 'package:medteam/Screen/ProfileInfo.dart';
import 'package:medteam/Utils/colors.dart';

class ShowCaseProfile extends StatefulWidget {
  @override
  _ShowCaseProfileState createState() => _ShowCaseProfileState();
}

class _ShowCaseProfileState extends State<ShowCaseProfile> {
  late double screenWidth, screenHeight;

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
          child: Container(
            color: white,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      color: white,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  child: Image.asset(
                                    'assets/back_arrow.png',
                                    width: 30.h,
                                    height: 30.h,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  padding: EdgeInsets.only(top: 30),
                                  child: Image.asset(
                                    'assets/describe.png',
                                    width: 236.h,
                                    height: 180.h,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Container(
                            margin: EdgeInsets.only(top: 25.h),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 40,right: 40),
                                  child: Text(
                                    'Showcase your Profile',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 25.sp,
                                        fontFamily: 'nunit_bold'),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Container(
                                    margin: EdgeInsets.only(left: 40,right: 40),
                                    child: Text(
                                      'Before you can bid on a shift, you need to build you profile.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: gray,
                                          fontSize: 14.sp,
                                          fontFamily: 'nunit_regular'),
                                    )),
                                SizedBox(height: 10,),
                                Container(
                                    margin: EdgeInsets.only(left: 40,right: 40),
                                    child: Text(
                                      'Facilities select providers for a shift based on the rate you bid and your credentials such as sub-specialities and years of experience in those sub-specialities, any professional licenses you may have, and any certificates you have attained.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: gray,
                                          fontSize: 14.sp,
                                          fontFamily: 'nunit_regular'),
                                    )),
                                SizedBox(height: 10,),
                                Container(
                                    margin: EdgeInsets.only(left: 40,right: 40),
                                    child: Text(
                                      'Click & Staff also need your W-9 and Bank information to send your Payout within two business days after facilty approves your time.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: gray,
                                          fontSize: 14.sp,
                                          fontFamily: 'nunit_regular'),
                                    )),
                                SizedBox(height: 10,),Container(
                                    margin: EdgeInsets.only(left: 40,right: 40),
                                    child: Text(
                                      'Please showcase your Profile to all facilities in your area by following five simple steps.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: gray,
                                          fontSize: 14.sp,
                                          fontFamily: 'nunit_regular'),
                                    )),
                                SizedBox(height: 20,),

                                Container(
                                  child: Center(
                                    child: CommonButtonWithPadding(
                                        label: 'NEXT',
                                        onPressed: () async {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => ProfileInfo()));
                                        },
                                        border: 35.h,
                                        height: 50.h,
                                        fontSize: 18,
                                        textColor: white,
                                        backgroundColor: black),
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
          ),
        ));
  }
}
