import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medteam/Components/CommonButton.dart';
import 'package:medteam/Components/CommonButtonWhite.dart';
import 'package:medteam/Components/CommonButtonWithPadding.dart';
import 'package:medteam/Components/CommonTextField.dart';
import 'package:medteam/Screen/BottomMenuBar.dart';
import 'package:medteam/Screen/PaymentMethod.dart';
import 'package:medteam/Utils/colors.dart';

class AppliedShifts extends StatefulWidget {
  @override
  _AppliedShiftsState createState() => _AppliedShiftsState();
}

class _AppliedShiftsState extends State<AppliedShifts> {
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
          'Applied Shift',
          style: TextStyle(color: white, fontFamily: 'nunit_bold'),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          color: color_box_bg,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 15),

                      Column(children: List.generate(5, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 15,top: 15,right: 15,),
                          child: Container(
                            color: Colors.white,
                            child: Column(children: [
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  SizedBox(width: 5,),
                                  Container(
                                    margin: EdgeInsets.only(left: 5,right: 15),
                                    height: 35,
                                    width: 35,
                                    child: Icon(Icons.cases_outlined),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Text(
                                          'Community Hospital',
                                          textAlign: TextAlign.start,
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
                              Row(
                                children: [
                                  SizedBox(width: 5,),
                                  Container(
                                    margin: EdgeInsets.only(left: 5,right: 15),
                                    height: 35,
                                    width: 35,
                                    child: Icon(Icons.location_on,color: Colors.grey,),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Text(
                                          '93 agrons paris \nnew york,NY 123',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.grey.withOpacity(.5),
                                              fontSize: 14.sp,
                                              fontFamily: 'nunit_regular'),

                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 5,),
                                  Container(
                                    margin: EdgeInsets.only(left: 5,right: 15),
                                    height: 35,
                                    width: 35,
                                    child: Icon(Icons.calendar_month,color: Colors.grey,),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Text(
                                          'Aug 10 2021',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: black,
                                              fontSize: 14.sp,
                                              fontFamily: 'nunit_extrabold'),

                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(child:   Column(
                                    children: [

                                      Row(
                                        children: [
                                          SizedBox(width: 5,),
                                          Container(
                                            margin: EdgeInsets.only(left: 5,right: 15),
                                            height: 35,
                                            width: 35,
                                            child: Icon(Icons.lock_clock,color: Colors.grey,),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                margin: EdgeInsets.only(right: 10),
                                                child: Text(
                                                  '9:30 Am - 10:30 Am',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      color: Colors.grey.withOpacity(.5),
                                                      fontSize: 14.sp,
                                                      fontFamily: 'nunit_regular'),

                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(width: 5,),
                                          Container(
                                            margin: EdgeInsets.only(left: 5,right: 15),
                                            height: 35,
                                            width: 35,
                                            child: Icon(Icons.phone,color: Colors.grey,),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                margin: EdgeInsets.only(right: 10),
                                                child: Text(
                                                  'Your bid Value',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14.sp,
                                                      fontFamily: 'nunit_regular'),

                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),flex: 1,),
                                  Expanded(child:  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Container(
                                      height: 45,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        color: gradient_color_light,
                                        borderRadius: BorderRadius.circular(
                                            20),

                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 0.0, right: 0),
                                          child: Text(
                                            'Details',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.sp,
                                              fontFamily: 'nunit_bold',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ) ,flex: 0,)

                                ,
                                ],
                              ),
                              SizedBox(height: 10,),
                            ],),
                          ),
                        );
                      })),



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
