import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medteam/Components/CommonButton.dart';
import 'package:medteam/Components/CommonButtonWhite.dart';
import 'package:medteam/Components/CommonTextField.dart';
import 'package:medteam/Screen/FindWork.dart';
import 'package:medteam/Utils/colors.dart';

class FindShifts extends StatefulWidget {
  @override
  _FindShiftsState createState() => _FindShiftsState();
}

class _FindShiftsState extends State<FindShifts> {
  late double screenWidth, screenHeight;
  late TextEditingController mobile_controller;
  late FocusNode mobile_focusnode;
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
                          Container(
                            child: Image.asset(
                              'assets/map.png',
                              width: screenWidth,
                              height: 220.h,
                              fit: BoxFit.fill,
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(top: 15.h,bottom: 10.h),
                            child: Column(
                              children: [
                                Container(
                                  child: Text(
                                    'Find Shifts Near you',
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 25.sp,
                                        fontFamily: 'nunit_bold'),
                                  ),

                                ),
                                Container(
                                  margin:
                                  EdgeInsets.only(top: 10.h,left: 25.h,right: 25.h),
                                  child: Text(
                                    'Click & Staff helps you find and manage shifts based on your location It\'s very important that your "Always Allow" click & staff  access so you may discover near by shifts',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: gray,
                                        fontSize: 15.sp,
                                        fontFamily: 'nunit_regular'),
                                  ),

                                ),Container(
                                  margin:
                                  EdgeInsets.only(top: 20.h,left: 25.h,right: 25.h),
                                  child: Text(
                                    'Avoid \'only While Using the App\' or \'Don\'t Allow\' because the App utilizes your location when you \'Clock In\' and \'Clock out\' your shift.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: gray,
                                        fontSize: 15.sp,
                                        fontFamily: 'nunit_regular'),
                                  ),

                                ),

                                SizedBox(height: 40.h),

                                Container(
                                     child:  CommonButton(
                                         label: 'ALWAYS ALLOW',
                                         onPressed: () async {
                                           Navigator.push(
                                               context,
                                               MaterialPageRoute(
                                                   builder: (context) => FindWork()));
                                         },
                                         border: 35.h,
                                         height: 50.h,
                                         fontSize: 18,
                                         textColor: white,
                                         backgroundColor: black),
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
  final border = UnderlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide.none,
  );
}
