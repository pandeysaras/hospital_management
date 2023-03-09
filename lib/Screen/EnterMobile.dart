import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medteam/Components/CommonButton.dart';
import 'package:medteam/Components/CommonButtonWhite.dart';
import 'package:medteam/Components/CommonTextField.dart';
import 'package:medteam/Screen/VerifyPhoneNumber.dart';
import 'package:medteam/Utils/colors.dart';
import 'package:medteam/Utils/utils.dart';
import 'package:medteam/view_model/sign_up_view_models/moile_view_model.dart';
import 'package:provider/provider.dart';

class EnterMobileScreen extends StatefulWidget {
  @override
  _EnterMobileScreenState createState() => _EnterMobileScreenState();
}

class _EnterMobileScreenState extends State<EnterMobileScreen> {
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
                            'Mobile Number',
                            style: TextStyle(
                                color: black,
                                fontSize: 25.sp,
                                fontFamily: 'nunit_bold'),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: 0.h, left: 40.h, right: 40.h),
                          child: Text(
                            'Enter your mobile number below,and we will send a verification code to your phone',
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
                              thecontroller: mobile_controller,
                              label: "Enter Your Mobile Number",
                              type: TextInputType.number,
                              action: TextInputAction.done,
                              lines: 1,
                              secure: false,
                              focusChange: () {
                                mobile_focusnode.unfocus();
                              },
                              fontSize: 18.sp,
                              focusNode: mobile_focusnode,
                              text_color: black,
                              hint_color: gray),
                        ),
                        Expanded(child: Container()),

                        /*ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, position) {
                                return Column(
                                  children: [
                                    Align(
                                      alignment:Alignment.topLeft,
                                      child: Container(
                                        decoration: new BoxDecoration(
                                            color: app_text_color,
                                            borderRadius: BorderRadius.all(Radius.circular(20))

                                        ),
                                        margin: EdgeInsets.only(
                                            left: 40.h, top: 10.h),
                                        padding: EdgeInsets.only(left:13.h,right:13.h,top: 3.h,bottom: 3.h),
                                        child:  Text(
                                          'abc abc',
                                          style: TextStyle(
                                            color: white,
                                            fontSize: 18.sp,
                                            fontFamily:
                                            'nunit_bold',
                                          ),
                                        ),

                                      ),
                                    )

                                  ],
                                );
                              },
                              itemCount: 5,
                            ),*/
                        SizedBox(height: 25.h),
                        Container(
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
                              context
                                      .watch<EnterMobileNumberViewModel>()
                                      .isLoading
                                  ? Expanded(
                                      child: SizedBox(
                                        // height: 50,
                                        // width: 50,
                                        child: Padding(
                                          padding: const EdgeInsets.all(
                                            30.0,
                                          ),
                                          child: LinearProgressIndicator(),
                                        ),
                                      ),
                                    )
                                  : CommonButton(
                                      label: 'NEXT',
                                      onPressed: () async {
                                        if (mobile_controller
                                            .value.text.isNotEmpty) {
                                          context
                                              .read<
                                                  EnterMobileNumberViewModel>()
                                              .enterNameWithData(
                                                  mobile_controller, context);
                                        } else {
                                          Utils.showSnackBar(context,
                                              "Empty Field", Colors.blue);
                                        }
                                      },
                                      border: 35.h,
                                      height: 50.h,
                                      fontSize: 18,
                                      textColor: white,
                                      backgroundColor: black),
                            ],
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
}
