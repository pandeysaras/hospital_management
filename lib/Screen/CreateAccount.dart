import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medteam/Components/CommonButton.dart';
import 'package:medteam/Components/CommonButtonWhite.dart';
import 'package:medteam/Components/CommonTextField.dart';
import 'package:medteam/Screen/FindShifts.dart';
import 'package:medteam/Screen/Welcome.dart';
import 'package:medteam/Utils/colors.dart';
import 'package:medteam/view_model/sign_up_view_models/auth_view_model.dart';
import 'package:provider/provider.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  late double screenWidth, screenHeight;
  late TextEditingController email_controller,
      cemail_controller,
      password_controller,
      cpassword_controller;
  late FocusNode email_focusnode,
      cemail_focusnode,
      password_focusnode,
      cpassword_focusnode;
   bool check1 = false, check2 = false;
   void _toggleCheck1 () {
     setState(() {
       check1 = !check1;
     });
   }
  void _toggleCheck2 () {
    setState(() {
      check2 = !check2;
    });
  }
  @override
  void initState() {
    super.initState();
    email_controller = TextEditingController();
    email_focusnode = FocusNode();
    cemail_controller = TextEditingController();
    cemail_focusnode = FocusNode();
    password_controller = TextEditingController();
    password_focusnode = FocusNode();
    cpassword_controller = TextEditingController();
    cpassword_focusnode = FocusNode();
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
                          margin: EdgeInsets.only(top: 40.h, bottom: 10.h),
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                  'Create Account',
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 25.sp,
                                      fontFamily: 'nunit_bold'),
                                ),
                              ),
                              Container(
                                child: Text(
                                  'What is your email?',
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 15.sp,
                                      fontFamily: 'nunit_bold'),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 10.h, left: 50.h, right: 50.h),
                                child: Text(
                                  'This will be used as your login, and to receive emails related to your account',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: gray,
                                      fontSize: 15.sp,
                                      fontFamily: 'nunit_regular'),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 20.h, left: 40.h, right: 40.h),
                                child: CommonTextField(
                                    thecontroller: email_controller,
                                    label: "Email ID",
                                    type: TextInputType.emailAddress,
                                    action: TextInputAction.next,
                                    lines: 1,
                                    secure: false,
                                    focusChange: () {
                                      email_focusnode.unfocus();
                                    },
                                    fontSize: 18.sp,
                                    focusNode: email_focusnode,
                                    text_color: black,
                                    hint_color: gray),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 20.h, left: 40.h, right: 40.h),
                                child: CommonTextField(
                                    thecontroller: cemail_controller,
                                    label: "Confirm Email ID",
                                    type: TextInputType.emailAddress,
                                    action: TextInputAction.next,
                                    lines: 1,
                                    secure: false,
                                    focusChange: () {
                                      cemail_focusnode.unfocus();
                                    },
                                    fontSize: 18.sp,
                                    focusNode: cemail_focusnode,
                                    text_color: black,
                                    hint_color: gray),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 20.h, left: 40.h, right: 40.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(color: black, width: 1),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                          maxLines: 1,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          textInputAction: TextInputAction.next,
                                          obscureText: true,
                                          autofocus: false,
                                          enabled: true,
                                          cursorColor: black,
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            color: black,
                                            fontFamily: "nunit_regular",
                                          ),
                                          controller: password_controller,
                                          focusNode: password_focusnode,
                                          onEditingComplete: () {
                                            // focusChange();
                                            password_focusnode.unfocus();
                                          },
                                          decoration: InputDecoration(
                                            focusedBorder: border,
                                            border: border,
                                            enabledBorder: border,
                                            disabledBorder: border,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 0.0,
                                                    horizontal: 15.0),
                                            hintText: "Create Password",
                                            hintStyle: TextStyle(
                                              fontSize: 18.sp,
                                              color: gray,
                                              fontFamily: "nunit_regular",
                                            ),
                                            suffixIconConstraints:
                                                BoxConstraints(
                                                    maxHeight: 20,
                                                    maxWidth: 35),
                                            suffixIcon: GestureDetector(
                                              onTap: () {
                                                //loginController.pass_secure.value = !loginController.pass_secure.value;
                                              },
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 15),
                                                  child: Image.asset(
                                                    'assets/close_eye.png',
                                                  )),
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 20.h, left: 40.h, right: 40.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(color: black, width: 1),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                          maxLines: 1,
                                          keyboardType:
                                              TextInputType.visiblePassword,
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
                                          controller: cpassword_controller,
                                          focusNode: cpassword_focusnode,
                                          onEditingComplete: () {
                                            // focusChange();
                                            cpassword_focusnode.unfocus();
                                          },
                                          decoration: InputDecoration(
                                            focusedBorder: border,
                                            border: border,
                                            enabledBorder: border,
                                            disabledBorder: border,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 0.0,
                                                    horizontal: 15.0),
                                            hintText: "Confirm Password",
                                            hintStyle: TextStyle(
                                              fontSize: 18.sp,
                                              color: gray,
                                              fontFamily: "nunit_regular",
                                            ),
                                            suffixIconConstraints:
                                                BoxConstraints(
                                                    maxHeight: 20,
                                                    maxWidth: 35),
                                            suffixIcon: GestureDetector(
                                              onTap: () {
                                                //loginController.pass_secure.value = !loginController.pass_secure.value;
                                              },
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 15),
                                                  child: Image.asset(
                                                    'assets/close_eye.png',
                                                  )),
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 10.h, left: 20.h, right: 5.h),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: _toggleCheck1,
                                      child: Center(
                                        child: Container(
                                            width: 20.h,
                                            height: 20.h,
                                          margin: EdgeInsets.only(
                                              left: 0.h, right: 10.h),
                                          decoration: BoxDecoration(
                                            color: check1 ? Color(0xFF0075B2) : Colors.white,
                                            borderRadius: BorderRadius.circular(5),
                                            border: check1 ? null :Border.all(color: Colors.grey)
                                          ),
                                          child: Icon(Icons.check, size: 15, color: Colors.white,)
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Text(
                                              'I agree to the App usage',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: gray,
                                                  fontSize: 14.sp,
                                                  fontFamily: 'nunit_regular'),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              'Terms & condition.',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: app_text_color,
                                                  fontSize: 14.sp,
                                                  fontFamily: 'nunit_regular'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 10.h, left: 20.h, right: 5.h),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: _toggleCheck2,
                                      child: Center(
                                        child: Container(
                                            width: 20.h,
                                            height: 20.h,
                                            margin: EdgeInsets.only(
                                                left: 0.h, right: 10.h),
                                            decoration: BoxDecoration(
                                                color: check2 ? Color(0xFF0075B2) : Colors.white,
                                                borderRadius: BorderRadius.circular(5),
                                                border: check2 ? null :Border.all(color: Colors.grey)
                                            ),
                                            child: Icon(Icons.check, size: 15, color: Colors.white,)
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Text(
                                              'I agree to the',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: gray,
                                                  fontSize: 14.sp,
                                                  fontFamily: 'nunit_regular'),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              ' Independent Contract Agreement.',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: app_text_color,
                                                  fontSize: 14.sp,
                                                  fontFamily: 'nunit_regular'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                        margin: EdgeInsets.only(left: 25.w),
                                        child: context
                                                .watch<AuthViewModel>()
                                                .isLoading
                                            ? SizedBox(
                                                // height: 50,
                                                // width: 50,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    30.0,
                                                  ),
                                                  child:
                                                      LinearProgressIndicator(),
                                                ),
                                              )
                                            : CommonButton(
                                                label: 'SUBMIT',
                                                onPressed: () async {
                                                  if (email_controller
                                                              .value.text ==
                                                          cemail_controller
                                                              .value.text &&
                                                      password_controller
                                                              .value.text ==
                                                          cpassword_controller.value
                                                              .text &&
                                                      email_controller.value
                                                          .text.isNotEmpty &&
                                                      cemail_controller.value
                                                          .text.isNotEmpty &&
                                                      password_controller.value
                                                          .text.isNotEmpty &&
                                                      cpassword_controller.value
                                                          .text.isNotEmpty) {
                                                    context
                                                        .read<AuthViewModel>()
                                                        .signUpWithData(
                                                          email_controller,
                                                          cemail_controller,
                                                          password_controller,
                                                          cpassword_controller,
                                                          context,
                                                        );
                                                  } else {
                                                    print(
                                                        "somfields are wrong");
                                                  }
                                                },
                                                border: 35.h,
                                                height: 50.h,
                                                fontSize: 18,
                                                textColor: white,
                                                backgroundColor: black),
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

  final border = UnderlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide.none,
  );
}
