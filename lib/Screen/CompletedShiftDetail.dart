import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medteam/Components/CommonButton.dart';
import 'package:medteam/Components/CommonButtonWhite.dart';
import 'package:medteam/Components/CommonButtonWithPadding.dart';
import 'package:medteam/Components/CommonTextField.dart';
import 'package:medteam/Screen/BottomMenuBar.dart';
import 'package:medteam/Screen/PaymentMethod.dart';
import 'package:medteam/Utils/colors.dart';

class CompletedShiftDetail extends StatefulWidget {
  @override
  _CompletedShiftDetailState createState() => _CompletedShiftDetailState();
}

class _CompletedShiftDetailState extends State<CompletedShiftDetail> {
  late double screenWidth, screenHeight;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  late TextEditingController mobile_controller, license_no_controller;
  late FocusNode mobile_focusnode, license_no_focusnode;
  String gender = "male";

  @override
  void initState() {
    super.initState();
    mobile_controller = TextEditingController();
    license_no_controller = TextEditingController();
    mobile_focusnode = FocusNode();
    license_no_focusnode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    ScreenUtil.init(context, designSize: Size(screenWidth, screenHeight));

    return Scaffold(
      key: _key,
      backgroundColor:   color_box_bg,
      appBar: AppBar(
        title: Text(
          'Completed Shift Details',
          style: TextStyle(color: white, fontFamily: 'nunit_bold'),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          color: white,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 15,top: 25,bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 15),
                        Row(
                          children: [
                 Expanded(child:  Container(

                     child: Text(
                       'Shift Title',
                       textAlign: TextAlign.start,
                       style: TextStyle(
                           color: black,
                           fontSize: 24.sp,
                           fontFamily: 'nunit_extrabold'),

                     ),
                 ),flex: 1,),
                 Expanded(child:  Padding(
                   padding: const EdgeInsets.only(right: 15.0),
                   child: Container(

                       child: Text(
                         '#231',
                         textAlign: TextAlign.start,
                         style: TextStyle(
                             color: black,
                             fontSize: 24.sp,
                             fontFamily: 'nunit_extrabold'),

                       ),
                   ),
                 ),flex: 0,)
            ,
                         ],
                        ),
                        SizedBox(height: 15),
                        Container(

                          child: Text(
                            'Your bid value:\$20/hr',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: black,
                                fontSize: 18.sp,
                                fontFamily: 'nunit_regular'),

                          ),
                        ),
                        SizedBox(height: 15),
                        Container(

                          child: Text(
                            'Shift time:8Hrs',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: black,
                                fontSize: 18.sp,
                                fontFamily: 'nunit_regular'),

                          ),
                        ),
                        SizedBox(height: 15),
                        Container(

                          child: Text(
                            'Over time:8Hrs',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: black,
                                fontSize: 18.sp,
                                fontFamily: 'nunit_regular'),

                          ),
                        ),
                        SizedBox(height: 45),
                        Container(

                          child: Text(
                            'Final shift time: 10 hrs',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: black,
                                fontSize: 18.sp,
                                fontFamily: 'nunit_extrabold'),

                          ),
                        ),
                        SizedBox(height: 15),
                        Container(

                          child: Text(
                            'Total amount: \$200',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: black,
                                fontSize: 18.sp,
                                fontFamily: 'nunit_extrabold'),

                          ),
                        ),
                        SizedBox(height: 15),
                        Container(

                          child: Text(
                            'Payment Status: Paid\/Not Paid',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: black,
                                fontSize: 18.sp,
                                fontFamily: 'nunit_extrabold'),

                          ),
                        ),

                        SizedBox(
                          height: 30.h,
                        ),

                      ],
                    ),
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
