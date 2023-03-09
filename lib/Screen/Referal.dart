import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medteam/Components/CommonButton.dart';
import 'package:medteam/Components/CommonButtonWhite.dart';
import 'package:medteam/Components/CommonTextField.dart';
import 'package:medteam/Screen/HearAboutUs.dart';
import 'package:medteam/Utils/colors.dart';

class Referal extends StatefulWidget {
  @override
  _ReferalState createState() => _ReferalState();
}

class _ReferalState extends State<Referal> {
  late double screenWidth, screenHeight;
  late TextEditingController referral_controller;
  late FocusNode referral_focusnode;
  @override
  void initState() {
    super.initState();
    referral_controller = TextEditingController();
    referral_focusnode = FocusNode();
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
                SizedBox(height: 45.h,),
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
                          margin:
                          EdgeInsets.only(top: 40.h, left: 40.h),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Do You Have Referral code?',
                              style: TextStyle(
                                  color: black,
                                  fontSize: 18.sp,
                                  fontFamily: 'nunit_bold'),
                            ),
                          ),
                        ),
                        Container(
                            margin:
                            EdgeInsets.only(top: 20.h, left: 40.h,right: 40.h),
                           child: CommonTextField(
                                thecontroller: referral_controller,
                                label: "Referral code",
                                type: TextInputType.text,
                                action: TextInputAction.done,
                                lines: 1,
                                secure: false,
                                focusChange: () {
                                  referral_focusnode.unfocus();
                                },
                                fontSize: 18.sp,
                                focusNode: referral_focusnode,
                                text_color: black,
                                hint_color:gray
                            ),

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
                          margin: EdgeInsets.only(left: 40.h,right: 40.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonButtonWhite(
                                  label: 'SKIP',
                                  onPressed: () async {},
                                  border: 35.h,
                                  height: 50.h,
                                  fontSize: 18,
                                  textColor: black,
                                  backgroundColor: black),
                              CommonButton(
                                  label: 'APPLY',
                                  onPressed: () async {
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                  builder: (context) => HearAboutUs()));
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
