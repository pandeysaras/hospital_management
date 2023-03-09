import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medteam/Components/CommonButton.dart';
import 'package:medteam/Components/CommonButtonWhite.dart';
import 'package:medteam/Components/CommonTextField.dart';
import 'package:medteam/Screen/EnterName.dart';
import 'package:medteam/Utils/colors.dart';

class VerifyPhoneNumber extends StatefulWidget {
  @override
  _VerifyPhoneNumberState createState() => _VerifyPhoneNumberState();
}

class _VerifyPhoneNumberState extends State<VerifyPhoneNumber> {
  late double screenWidth, screenHeight;
  late TextEditingController mobile_controller_1,
      mobile_controller_2,
      mobile_controller_3,
      mobile_controller_4;
  late FocusNode mobile_focusnode_1,
      mobile_focusnode_2,
      mobile_focusnode_3,
      mobile_focusnode_4;

  @override
  void initState() {
    super.initState();
    mobile_controller_1 = TextEditingController();
    mobile_focusnode_1 = FocusNode();
    mobile_controller_2 = TextEditingController();
    mobile_focusnode_2 = FocusNode();
    mobile_controller_3 = TextEditingController();
    mobile_focusnode_3 = FocusNode();
    mobile_controller_4 = TextEditingController();
    mobile_focusnode_4 = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    ScreenUtil.init(context, designSize: Size(screenWidth, screenHeight));

    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                Expanded(
                  child: Container(
                    height: double.infinity,
                    margin: EdgeInsets.only(top: 40.h),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            'Verify your phone number',
                            style: TextStyle(
                                color: black,
                                fontSize: 25.sp,
                                fontFamily: 'nunit_bold'),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: 0.h, left: 65.h, right: 65.h),
                          child: Text(
                            'Enter the 4-digit verification code sent to (910)255-5222',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: gray,
                                fontSize: 15.sp,
                                fontFamily: 'nunit_regular'),
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment
                                .center, // If you want align text to left
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                padding: EdgeInsets.only(bottom: 5.h),
                                decoration: BoxDecoration(
                                  border: Border.all(color: black, width: 1),
                                ),
                                child: TextField(
                                  maxLines: 1,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                  autofocus: false,
                                  enabled: true,
                                  cursorColor: black,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: black,
                                    fontFamily: "nunit_extrabold",
                                  ),
                                  controller: mobile_controller_1,
                                  focusNode: mobile_focusnode_1,
                                  onEditingComplete: () {
                                    mobile_focusnode_1.unfocus();
                                  },
                                  decoration: InputDecoration(
                                    focusedBorder: border,
                                    border: border,
                                    enabledBorder: border,
                                    disabledBorder: border,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: 15.0),
                                    hintText: "",
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: gray,
                                      fontFamily: "nunit_extrabold",
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Container(
                                height: 45.w,
                                width: 45.w,
                                padding: EdgeInsets.only(bottom: 5.h),
                                decoration: BoxDecoration(
                                  border: Border.all(color: black, width: 1),
                                ),
                                child: TextField(
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                  autofocus: false,
                                  enabled: true,
                                  cursorColor: black,
                                  style: TextStyle(
                                    fontSize: 18.w,
                                    color: black,
                                    fontFamily: "nunit_extrabold",
                                  ),
                                  controller: mobile_controller_2,
                                  focusNode: mobile_focusnode_2,
                                  onEditingComplete: () {
                                    //focusChange();
                                    mobile_focusnode_2.unfocus();
                                  },
                                  decoration: InputDecoration(
                                    focusedBorder: border,
                                    border: border,
                                    enabledBorder: border,
                                    disabledBorder: border,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Container(
                                height: 45.w,
                                width: 45.w,
                                padding: EdgeInsets.only(bottom: 5.h),
                                decoration: BoxDecoration(
                                  border: Border.all(color: black, width: 1),
                                ),
                                child: TextField(
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                  autofocus: false,
                                  enabled: true,
                                  cursorColor: black,
                                  style: TextStyle(
                                    fontSize: 18.w,
                                    color: black,
                                    fontFamily: "nunit_extrabold",
                                  ),
                                  controller: mobile_controller_3,
                                  focusNode: mobile_focusnode_3,
                                  onEditingComplete: () {
                                    //focusChange();
                                    mobile_focusnode_3.unfocus();
                                  },
                                  decoration: InputDecoration(
                                    focusedBorder: border,
                                    border: border,
                                    enabledBorder: border,
                                    disabledBorder: border,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Container(
                                height: 45.w,
                                width: 45.w,
                                padding: EdgeInsets.only(bottom: 5.h),
                                decoration: BoxDecoration(
                                  border: Border.all(color: black, width: 1),
                                ),
                                child: TextField(
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  obscureText: false,
                                  autofocus: false,
                                  enabled: true,
                                  cursorColor: black,
                                  style: TextStyle(
                                    fontSize: 18.w,
                                    color: black,
                                    fontFamily: "nunit_extrabold",
                                  ),
                                  controller: mobile_controller_4,
                                  focusNode: mobile_focusnode_4,
                                  onEditingComplete: () {
                                    //focusChange();
                                    mobile_focusnode_4.unfocus();
                                  },
                                  decoration: InputDecoration(
                                    focusedBorder: border,
                                    border: border,
                                    enabledBorder: border,
                                    disabledBorder: border,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 60, right: 60),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 0.h),
                                child: Text(
                                  'Resend code',
                                  style: TextStyle(
                                      color: app_text_color,
                                      fontSize: 15.sp,
                                      fontFamily: 'nunit_bold'),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0.h),
                                child: Text(
                                  'Edit number',
                                  style: TextStyle(
                                      color: app_text_color,
                                      fontSize: 15.sp,
                                      fontFamily: 'nunit_bold'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: 0.h, left: 40.h, right: 40.h),
                          child: Text(
                            'By verifying your mobile number, you agree to recieve notices and updates relating to your account via text message',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: gray,
                                fontSize: 16.sp,
                                fontFamily: 'nunit_regular'),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: 0.h, left: 40.h, right: 40.h),
                          child: Text(
                            'Standard message rates may apply',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: app_text_color,
                                fontSize: 16.sp,
                                fontFamily: 'nunit_regular'),
                          ),
                        ),
                        SizedBox(height: 25.h),
                        Expanded(
                          child: Container(
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
                                    textColor: black,
                                    backgroundColor: black),
                                CommonButton(
                                    label: 'NEXT',
                                    onPressed: () async {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EnterNameScreen()));
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
                        SizedBox(height: 30.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  final border = UnderlineInputBorder(
    borderSide: BorderSide.none,
  );
}
