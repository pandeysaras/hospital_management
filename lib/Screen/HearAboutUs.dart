import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medteam/Components/CommonButton.dart';
import 'package:medteam/Components/CommonButtonWhite.dart';
import 'package:medteam/Components/CommonTextField.dart';
import 'package:medteam/Screen/EnterMobile.dart';
import 'package:medteam/Utils/colors.dart';
import 'package:provider/provider.dart';

import '../model/hear_about_us_model.dart';
import '../view_model/sign_up_view_models/hear_view_model.dart';
import '../view_model/sign_up_view_models/post_hear_view_model.dart';

class HearAboutUs extends StatefulWidget {
  @override
  _HearAboutUsState createState() => _HearAboutUsState();
}

class _HearAboutUsState extends State<HearAboutUs> {
  late double screenWidth, screenHeight;
  late TextEditingController referral_controller;
  late FocusNode referral_focusnode;
  @override
  void initState() {
    super.initState();
    context.read<HearAboutUSViewModel>().getHearAboutUs();
    referral_controller = TextEditingController();
    referral_focusnode = FocusNode();
  }

  bool isSelected = false;

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
                SizedBox(
                  height: 20.h,
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
                    decoration: BoxDecoration(
                      color: round_color.withOpacity(0.10),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60.w),
                          topRight: Radius.circular(60.w)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 40.h, left: 40.h),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'How did you hear about us?',
                              style: TextStyle(
                                  color: black,
                                  fontSize: 18.sp,
                                  fontFamily: 'nunit_bold'),
                            ),
                          ),
                        ),
                        Expanded(
                            child: ListView.builder(
                              itemCount: context
                                  .watch<HearAboutUSViewModel>()
                                  .selectBoxesHearList
                                  .length,
                              itemBuilder: (context, index) {
                                return Align(
                                  alignment: Alignment.topLeft,
                                  child: GestureDetector(
                                    onTap: () {
                                      context.read<PostHearAboutUSViewModel>().ref =
                                          globalhearAboutUsModel!.data![index].name
                                              .toString();
                                      context
                                          .read<PostHearAboutUSViewModel>()
                                          .notifyListeners();

                                      setState(() {
                                        if (isSelected == true) {
                                          isSelected = false;
                                        } else {
                                          isSelected = true;
                                        }
                                      });
                                    },
                                    child: Container(
                                      width: screenWidth,
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? Colors.pink.withOpacity(0.3)
                                            : gradient_color_light,
                                      ),
                                      margin: EdgeInsets.only(
                                          left: 40.h, top: 10.h, right: 40.h),
                                      padding: EdgeInsets.only(
                                          left: 13.h,
                                          right: 13.h,
                                          top: 3.h,
                                          bottom: 3.h),
                                      child: Text(
                                        globalhearAboutUsModel!.data![index].name
                                            .toString(),
                                        style: TextStyle(
                                          color: white,
                                          fontSize: 20.sp,
                                          fontFamily: 'nunit_regular',
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )),

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
                              CommonButton(
                                  label: 'NEXT',
                                  onPressed: () async {
                                    context
                                        .read<PostHearAboutUSViewModel>()
                                        .postHearAboutUSWithData(context);
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
