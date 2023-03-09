import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medteam/Components/CommonButton.dart';
import 'package:medteam/Components/CommonButtonWhite.dart';
import 'package:medteam/Components/CommonTextField.dart';
import 'package:medteam/Screen/ProfilePhoto.dart';
import 'package:medteam/Utils/colors.dart';
import 'package:medteam/Utils/utils.dart';
import 'package:medteam/view_model/sign_up_view_models/enter_name_view_model.dart';
import 'package:provider/provider.dart';

class EnterNameScreen extends StatefulWidget {
  @override
  _EnterNameScreenState createState() => _EnterNameScreenState();
}

class _EnterNameScreenState extends State<EnterNameScreen> {
  late double screenWidth, screenHeight;
  late TextEditingController fname_controller,
      mname_controller,
      lname_controller;
  late FocusNode fname_focusnode, mname_focusnode, lname_focusnode;
  @override
  void initState() {
    super.initState();
    fname_controller = TextEditingController();
    fname_focusnode = FocusNode();
    mname_controller = TextEditingController();
    mname_focusnode = FocusNode();
    lname_controller = TextEditingController();
    lname_focusnode = FocusNode();
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
                child: Container(
                  color: white,
                  child: SingleChildScrollView(
                    child: Container(
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
                            margin: EdgeInsets.only(top: 40.h),
                            child: Column(
                              children: [
                                Container(
                                  child: Text(
                                    'Your Name',
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
                                    'Enter the name that apperas on your',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: gray,
                                        fontSize: 15.sp,
                                        fontFamily: 'nunit_regular'),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 0.h, left: 40.h, right: 40.h),
                                  child: Text(
                                    'Driver\'s license, state ID or passport ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 15.sp,
                                        fontFamily: 'nunit_bold'),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 20.h, left: 40.h, right: 40.h),
                                  child: CommonTextField(
                                      thecontroller: fname_controller,
                                      label: "First Name",
                                      type: TextInputType.text,
                                      action: TextInputAction.next,
                                      lines: 1,
                                      secure: false,
                                      focusChange: () {
                                        fname_focusnode.unfocus();
                                      },
                                      fontSize: 18.sp,
                                      focusNode: fname_focusnode,
                                      text_color: black,
                                      hint_color: gray),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 20.h, left: 40.h, right: 40.h),
                                  child: CommonTextField(
                                      thecontroller: mname_controller,
                                      label: "Middle Name",
                                      type: TextInputType.text,
                                      action: TextInputAction.next,
                                      lines: 1,
                                      secure: false,
                                      focusChange: () {
                                        mname_focusnode.unfocus();
                                      },
                                      fontSize: 18.sp,
                                      focusNode: mname_focusnode,
                                      text_color: black,
                                      hint_color: gray),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 20.h, left: 40.h, right: 40.h),
                                  child: CommonTextField(
                                      thecontroller: lname_controller,
                                      label: "Last Name",
                                      type: TextInputType.text,
                                      action: TextInputAction.done,
                                      lines: 1,
                                      secure: false,
                                      focusChange: () {
                                        lname_focusnode.unfocus();
                                      },
                                      fontSize: 18.sp,
                                      focusNode: lname_focusnode,
                                      text_color: black,
                                      hint_color: gray),
                                ),
                                SizedBox(height: 45.h),
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 40.h, right: 40.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                              .watch<EnterNameViewModel>()
                                              .isLoading
                                          ? Expanded(
                                              child: SizedBox(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    30.0,
                                                  ),
                                                  child:
                                                      LinearProgressIndicator(),
                                                ),
                                              ),
                                            )
                                          : CommonButton(
                                              label: 'NEXT',
                                              onPressed: () async {
                                                if (fname_controller.value.text.isNotEmpty &&
                                                    mname_controller.value.text
                                                        .isNotEmpty &&
                                                    lname_controller.value.text
                                                        .isNotEmpty) {
                                                  context
                                                      .read<
                                                          EnterNameViewModel>()
                                                      .enterNameWithData(
                                                        fname_controller,
                                                        mname_controller,
                                                        lname_controller,
                                                        context,
                                                      );
                                                } else {
                                                  Utils.showSnackBar(
                                                      context,
                                                      "Fields maybe empty",
                                                      Colors.blue);
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
                        ],
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
