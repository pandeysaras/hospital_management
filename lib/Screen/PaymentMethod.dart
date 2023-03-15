import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medteam/Components/CommonButton.dart';
import 'package:medteam/Components/CommonButtonWhite.dart';
import 'package:medteam/Components/CommonButtonWithPadding.dart';
import 'package:medteam/Components/CommonTextField.dart';
import 'package:medteam/Screen/ProfileCreated.dart';
import 'package:medteam/Screen/UploadedDocuments.dart';
import 'package:medteam/Utils/colors.dart';
import 'package:medteam/view_model/sign_up_view_models/profile_view_model.dart';
import 'package:provider/provider.dart';

class PaymentMethod extends StatefulWidget {
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  late double screenWidth, screenHeight;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  late TextEditingController mobile_controller;
  late FocusNode mobile_focusnode;
  String gender = "male";

  TextEditingController nameCtrl = TextEditingController();

  TextEditingController acnoCtrl = TextEditingController();

  TextEditingController cAcnoCtrl = TextEditingController();

  TextEditingController routeAcNoCtrl = TextEditingController();

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
              Align(
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
                              '5',
                              style: TextStyle(
                                color: white,
                                fontSize: 12.sp,
                                fontFamily: 'nunit_bold',
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Payment Method',
                          style: TextStyle(
                            color: black,
                            fontSize: 16.sp,
                            fontFamily: 'nunit_bold',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Divider(
                      color: black,
                    ),
                    SizedBox(height: 15),
                    Container(
                      margin: EdgeInsets.only(left: 40, right: 40),
                      child: Text(
                        'Select your Payment Method.This is where you will receive Payment.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: black,
                            fontSize: 16.sp,
                            fontFamily: 'nunit_regular'),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      padding: EdgeInsets.only(
                          left: 10, right: 0, top: 20, bottom: 40),
                      decoration: new BoxDecoration(
                        color: box_bg_color,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: app_text_color, width: 1),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 80),
                                child: Text(
                                  'Direct Deposite',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 15.sp,
                                      fontFamily: 'nunit_extrabold'),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    backgroundColor: white,
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30)),
                                    ),
                                    builder: (BuildContext context) {
                                      return SingleChildScrollView(
                                        child: Container(
                                          child: SizedBox(
                                            child: Column(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 40, right: 5),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Image.asset(
                                                        'assets/cancel.png',
                                                        height: 60,
                                                        width: 60,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'Bank Details',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: black,
                                                      fontSize: 15.sp,
                                                      fontFamily:
                                                          'nunit_extrabold'),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 20.h,
                                                      left: 30.h,
                                                      right: 30.h),
                                                  child: CommonTextField(
                                                      thecontroller: nameCtrl,
                                                      label:
                                                          "Account Holder Name",
                                                      type: TextInputType
                                                          .emailAddress,

                                                      lines: 1,
                                                      secure: false,
                                                      fontSize: 18.sp,
                                                      text_color: black,
                                                      hint_color: gray),
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 50.w,
                                                    ),
                                                    Radio(
                                                        groupValue: gender,
                                                        value: "Checking",
                                                        fillColor:
                                                            MaterialStateColor
                                                                .resolveWith(
                                                                    (states) =>
                                                                        gray),
                                                        activeColor:
                                                            Colors.black,
                                                        onChanged: (value) {
                                                          print(value);
                                                          setState(() {
                                                            setState(() {
                                                              gender = value
                                                                  .toString();
                                                            });
                                                          });
                                                        }),
                                                    Text(
                                                      'Checking',
                                                      style: TextStyle(
                                                          color: black,
                                                          fontSize: 15.sp,
                                                          fontFamily:
                                                              'nunit_extrabold'),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Radio(
                                                        groupValue: gender,
                                                        value: "Saving",
                                                        fillColor:
                                                            MaterialStateColor
                                                                .resolveWith(
                                                                    (states) =>
                                                                        gray),
                                                        activeColor:
                                                            Colors.black,
                                                        onChanged: (value) {
                                                          print(value);
                                                          setState(() {
                                                            gender = value
                                                                .toString();
                                                          });
                                                        }),
                                                    Text(
                                                      'Saving',
                                                      style: TextStyle(
                                                          color: black,
                                                          fontSize: 15.sp,
                                                          fontFamily:
                                                              'nunit_extrabold'),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 20.h,
                                                      left: 30.h,
                                                      right: 30.h),
                                                  child: CommonTextField(
                                                      thecontroller: acnoCtrl,
                                                      label: "Account Number",
                                                      type:
                                                          TextInputType.number,
                                                      lines: 1,
                                                      secure: false,

                                                      fontSize: 18.sp,

                                                      text_color: black,
                                                      hint_color: gray),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 20.h,
                                                      left: 30.h,
                                                      right: 30.h),
                                                  child: CommonTextField(
                                                      thecontroller: cAcnoCtrl,
                                                      label:
                                                          "Confirm Account Number",
                                                      type:
                                                          TextInputType.number,

                                                      lines: 1,
                                                      secure: false,
                                                      fontSize: 18.sp,
                                                      text_color: black,
                                                      hint_color: gray),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 20.h,
                                                      left: 30.h,
                                                      right: 30.h),
                                                  child: CommonTextField(
                                                      thecontroller:
                                                          routeAcNoCtrl,
                                                      label:
                                                          "Routing Account Number",
                                                      type:
                                                          TextInputType.number,
                                                      lines: 1,
                                                      secure: false,

                                                      fontSize: 18.sp,

                                                      text_color: black,
                                                      hint_color: gray),
                                                ),
                                                SizedBox(
                                                  height: 50,
                                                ),
                                                CommonButton(
                                                    label: 'COMPLETE',
                                                    onPressed: () async {
                                                      Navigator.pop(
                                                        context,
                                                      );
                                                    },
                                                    border: 35.h,
                                                    height: 50.h,
                                                    fontSize: 18,
                                                    textColor: white,
                                                    backgroundColor: black),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 0, top: 5, bottom: 5),
                                    decoration: new BoxDecoration(
                                        color: white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20),
                                        )),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/plus.png',
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Text(
                                            'Add',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: black,
                                                fontSize: 15.sp,
                                                fontFamily: 'nunit_extrabold'),
                                          ),
                                        ),
                                      ],
                                    )),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Image.asset(
                                  'assets/bank.png',
                                  height: 60,
                                  width: 70,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(left: 5, right: 15),
                                  child: Text(
                                    'Your Payout will arrive at your Bank within two Business days after your shift billable time is approved by the facility',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 14.sp,
                                        fontFamily: 'nunit_regular'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 60, right: 60),
                        child: Text(
                          ' Click & Staff does currently accomodate Checks, Paypal, Venmo, or Bitcoin. Please use one of the Payoutmethods above.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: black,
                              fontSize: 15.sp,
                              fontFamily: 'nunit_regular'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 40.h, right: 40.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CommonButtonWhite(
                                label: 'PREV',
                                onPressed: () async {},
                                border: 35.h,
                                height: 50.h,
                                fontSize: 18,
                                textColor: app_text_color,
                                backgroundColor: black),
                            SizedBox(
                              width: 20.w,
                            ),
                            context.watch<ProfileViewModel>().isLoading
                                ? Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: LinearProgressIndicator(),
                                    ),
                                  )
                                : CommonButton(
                                    label: 'NEXT',
                                    onPressed: () async {
                                      if (nameCtrl.value.text.isNotEmpty &&
                                          acnoCtrl.value.text.isNotEmpty &&
                                          cAcnoCtrl.value.text.isNotEmpty &&
                                          routeAcNoCtrl.value.text.isNotEmpty) {
                                        // print(
                                        //   nameCtrl.value.text +
                                        //       acnoCtrl.value.text +
                                        //       cAcnoCtrl.value.text +
                                        //       routeAcNoCtrl.value.text,
                                        // );
                                        context
                                            .read<ProfileViewModel>()
                                            .bankDetailsUploadlWIthData(
                                              context,
                                              nameCtrl.value.text,
                                              acnoCtrl.value.text,
                                              cAcnoCtrl.value.text,
                                              routeAcNoCtrl.value.text,
                                            );
                                      }

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => UploadedDocuments(),
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
                    ),
                    SizedBox(
                      height: 20.h,
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
