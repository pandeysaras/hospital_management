import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medteam/Components/CommonButton.dart';
import 'package:medteam/Components/CommonButtonWhite.dart';
import 'package:medteam/Components/CommonButtonWithPadding.dart';
import 'package:medteam/Components/CommonTextField.dart';
import 'package:medteam/Screen/BottomMenuBar.dart';
import 'package:medteam/Screen/PaymentMethod.dart';
import 'package:medteam/Utils/colors.dart';

class OnGoinShifts extends StatefulWidget {
  @override
  _OnGoinShiftsState createState() => _OnGoinShiftsState();
}

class _OnGoinShiftsState extends State<OnGoinShifts> {
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
          'Ongoing Shifts',
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
                        Text(
                          'Your Bid Value: \$20/hr',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: black,
                              fontSize: 16.sp,
                              fontFamily: 'nunit_regular'),

                        ),
                        SizedBox(height: 15),
                        Text(
                          'Shift Start in: 5hr 7mins',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: black,
                              fontSize: 16.sp,
                              fontFamily: 'nunit_regular'),

                        ),
                        SizedBox(height: 35),
                        Column(
                          children: [
                            Row(
                              children: [
                                Expanded(child:  Container(

                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 15.0,left: 25),
                                    child: Container(
                                      width: 150,
                                      decoration: BoxDecoration(

                                        borderRadius: BorderRadius.circular(
                                            2),
                                        border: Border.all(
                                            color: gradient_color_light,
                                            width: 2),
                                      ),
                                      child: TextField(

                                          maxLines: 1,
                                          autofocus: false,
                                          enabled: true,
                                          cursorColor: black,
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            color: black,
                                            fontFamily: "nunit_regular",
                                          ),textAlign: TextAlign.center,
                                          controller: TextEditingController(text: "00:00:05"),
                                          onEditingComplete: () {
                                            // focusChange();
                                          },
                                          decoration: InputDecoration(
                                            focusedBorder: border,
                                            border: border,
                                            enabledBorder: border,
                                            disabledBorder: border,
                                            contentPadding: EdgeInsets
                                                .symmetric(
                                                vertical: 0.0,
                                                horizontal: 0.0),
                                            hintText: "",
                                            hintStyle: TextStyle(
                                              fontSize: 14.sp,
                                              color: gray,
                                              fontFamily: "nunit_regular",
                                            ),


                                          )),
                                    ),
                                  ),
                                ),flex: 0,),
                                Expanded(child:    InkWell(
                                    onTap:(){

                                    },
                                    child:Center(
                                      child: Container(
                                        height: 45,
                                        width: 155,
                                        decoration: BoxDecoration(
                                          color: gradient_color_light,
                                          borderRadius: BorderRadius.circular(
                                              15),
                                          border: Border.all(
                                              color: gradient_color_light,
                                              width: 1),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0.0, right: 0),
                                            child: Text(
                                              'Start/End',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.sp,
                                                fontFamily: 'nunit_regular',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),flex: 0,)
                                ,
                              ],
                            ),
                            SizedBox(height: 22),
                            Text(
                              'Total Shift time: 7hrs',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: black,
                                  fontSize: 16.sp,
                                  fontFamily: 'nunit_regular'),

                            ),
                          ],
                        ),
                        SizedBox(height: 35),
                        Container(height: 1,color: Colors.black,),
                        SizedBox(height: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 22),
                            Text(
                              'Add More Hours To Shift',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: black,
                                  fontSize: 16.sp,
                                  fontFamily: 'nunit_regular'),

                            ),
                            SizedBox(height: 22),
                            Row(
                              children: [
                                Expanded(child:  Container(

                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 15.0,left: 25),
                                    child: Container(
                                      width: 150,
                                      decoration: BoxDecoration(

                                        borderRadius: BorderRadius.circular(
                                            2),
                                        border: Border.all(
                                            color: gradient_color_light,
                                            width: 2),
                                      ),
                                      child: TextField(

                                          maxLines: 1,
                                          autofocus: false,
                                          enabled: true,
                                          cursorColor: black,
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            color: black,
                                            fontFamily: "nunit_regular",
                                          ),textAlign: TextAlign.center,
                                          controller: TextEditingController(text: "00:00:05"),
                                          onEditingComplete: () {
                                            // focusChange();
                                          },
                                          decoration: InputDecoration(
                                            focusedBorder: border,
                                            border: border,
                                            enabledBorder: border,
                                            disabledBorder: border,
                                            contentPadding: EdgeInsets
                                                .symmetric(
                                                vertical: 0.0,
                                                horizontal: 0.0),
                                            hintText: "",
                                            hintStyle: TextStyle(
                                              fontSize: 14.sp,
                                              color: gray,
                                              fontFamily: "nunit_regular",
                                            ),


                                          )),
                                    ),
                                  ),
                                ),flex: 0,),
                                Expanded(child:    InkWell(
                                    onTap:(){

                                    },
                                    child:Center(
                                      child: Container(
                                        height: 45,
                                        width: 155,
                                        decoration: BoxDecoration(
                                          color: gradient_color_light,
                                          borderRadius: BorderRadius.circular(
                                              15),
                                          border: Border.all(
                                              color: gradient_color_light,
                                              width: 1),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0.0, right: 0),
                                            child: Text(
                                              'Add Hours',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.sp,
                                                fontFamily: 'nunit_regular',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),flex: 0,)
                                ,
                              ],
                            ),
                            SizedBox(height: 35),
                            Row(
                              children: [
                                Expanded(child:  Container(

                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 15.0,left: 25),
                                    child: Container(
                                      width: 150,
                                      decoration: BoxDecoration(

                                        borderRadius: BorderRadius.circular(
                                            2),
                                        border: Border.all(
                                            color: gradient_color_light,
                                            width: 2),
                                      ),
                                      child: TextField(

                                          maxLines: 1,
                                          autofocus: false,
                                          enabled: true,
                                          cursorColor: black,
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            color: black,
                                            fontFamily: "nunit_regular",
                                          ),textAlign: TextAlign.center,
                                          controller: TextEditingController(text: "00:00:05"),
                                          onEditingComplete: () {
                                            // focusChange();
                                          },
                                          decoration: InputDecoration(
                                            focusedBorder: border,
                                            border: border,
                                            enabledBorder: border,
                                            disabledBorder: border,
                                            contentPadding: EdgeInsets
                                                .symmetric(
                                                vertical: 0.0,
                                                horizontal: 0.0),
                                            hintText: "",
                                            hintStyle: TextStyle(
                                              fontSize: 14.sp,
                                              color: gray,
                                              fontFamily: "nunit_regular",
                                            ),


                                          )),
                                    ),
                                  ),
                                ),flex: 0,),
                                Expanded(child:    InkWell(
                                    onTap:(){

                                    },
                                    child:Center(
                                      child: Container(
                                        height: 45,
                                        width: 155,
                                        decoration: BoxDecoration(
                                          color: gradient_color_light,
                                          borderRadius: BorderRadius.circular(
                                              15),
                                          border: Border.all(
                                              color: gradient_color_light,
                                              width: 1),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0.0, right: 0),
                                            child: Text(
                                              'Start/End',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.sp,
                                                fontFamily: 'nunit_regular',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),flex: 0,)
                                ,
                              ],
                            ),
                            SizedBox(height: 45),
                            Text(
                              'Final Shift Time:10hrs',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: black,
                                  fontSize: 16.sp,
                                  fontFamily: 'nunit_regular'),

                            ),
                          ],
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
