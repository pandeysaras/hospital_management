import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medteam/Components/CommonButton.dart';
import 'package:medteam/Components/CommonTextField.dart';
import 'package:medteam/Screen/CreateAccount.dart';
import 'package:medteam/Utils/colors.dart';
import 'package:medteam/view_model/sign_up_view_models/login_view_model.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late double screenWidth, screenHeight;
  late TextEditingController email_controller, password_controller;
  late FocusNode email_focusnode, password_focusnode;


  @override
  void initState() {
    super.initState();
    email_controller = TextEditingController();
    email_focusnode = FocusNode();
    password_controller = TextEditingController();
    password_focusnode = FocusNode();
  }

  @override
  void dispose() {
    email_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);
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
                child: Container(
                  color: white,
                  child: SingleChildScrollView(
                    child: Center(
                      child: Container(
                        margin:
                            EdgeInsets.only(top: 60.h, right: 50.w, left: 50.w),
                        child: Column(
                          children: [
                            Container(
                              child: Image.asset(
                                'assets/login_image.png',
                                width: 236.h,
                                height: 180.h,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              'Welcome Back!',
                              style: TextStyle(
                                  color: black,
                                  fontSize: 30.sp,
                                  fontFamily: 'nunit_bold'),
                            ),
                            Text(
                              'Login to your click & staff account',
                              style: TextStyle(
                                  color: gray,
                                  fontSize: 15.sp,
                                  fontFamily: 'nunit_bold'),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            CommonTextField(
                                thecontroller: email_controller,
                                label: "Enter Email",
                                type: TextInputType.text,
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
                            SizedBox(
                              height: 15.h,
                            ),
                            CommonTextField(
                                thecontroller: password_controller,
                                label: "Password",
                                type: TextInputType.visiblePassword,
                                action: TextInputAction.done,
                                lines: 1,
                                secure: true,
                                focusChange: () {
                                  password_focusnode.unfocus();
                                },
                                fontSize: 18.sp,
                                focusNode: password_focusnode,
                                text_color: black,
                                hint_color: gray),
                            SizedBox(height: 5.h),
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    color: app_text_color,
                                    fontSize: 14.sp,
                                    fontFamily: 'nunit_bold'),
                              ),
                            ),
                            SizedBox(height: 15.h),

                                loginViewModel.loading ?  SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                      30.0,
                                    ),
                                    child:
                                    LinearProgressIndicator(),
                                  ),
                                ): CommonButton(
                                label: 'SIGN IN',
                                onPressed: () async {
                                    Map data = {
                                      "email":"mili@mailinator.com",
                                      "password":123456
                                    };
                                    loginViewModel.postLoginApi(data, context);
                                  /* Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => OrderDetail()));*/
                                },
                                border: 35,
                                height: 50,
                                fontSize: 18,
                                textColor: white,
                                backgroundColor: black),
                            SizedBox(height: 15.h),
                            Text(
                              "Or use touch id",
                              style: TextStyle(
                                  color: gray,
                                  fontSize: 14.sp,
                                  fontFamily: 'nunit_bold'),
                            ),
                            Container(
                              child: Image.asset(
                                'assets/finger.png',
                                width: 85.h,
                                height: 85.h,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Text(
                              "Login via SMS Verification code",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: app_text_color,
                                  fontSize: 14.sp,
                                  fontFamily: 'nunit_regular'),
                            ),
                            SizedBox(height: 15.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have account?",
                                  style: TextStyle(
                                      color: gray,
                                      fontSize: 17.sp,
                                      fontFamily: 'nunit_regular'),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CreateAccountScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    " SIGN UP",
                                    style: TextStyle(
                                        color: app_text_color,
                                        fontSize: 17.sp,
                                        fontFamily: 'nunit_bold'),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
