import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medteam/Components/CommonButtonWithPadding.dart';
import 'package:medteam/Components/CommonTextField.dart';
import 'package:medteam/Screen/BottomMenuBar.dart';
import 'package:medteam/Screen/W9Form.dart';
import 'package:medteam/Utils/colors.dart';
import 'package:medteam/model/state_data_model.dart';
import 'package:medteam/view_model/complete_profile_view_models/complete_profile_1_view_model.dart';
import 'package:medteam/view_model/state_list_view_model.dart';
import 'package:provider/provider.dart';

import '../Utils/utils.dart';

class ProfileInfo extends StatefulWidget {
  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  late double screenWidth, screenHeight;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  late TextEditingController security_controller,
      address1_controller,
      address2_controller,
      city_controller,
      zip_controller;
  late FocusNode security_focusnode,
      address1_focusnode,
      address2_focusnode,
      city_focusnode,
      zip_focusnode;
  TextEditingController _dateController = TextEditingController();
  TextEditingController _monthController = TextEditingController();
  TextEditingController _yearController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  bool isDateSelected = false;
  late int _selectedIndex;
  bool check = false;
  String dropdownValue = "State";
  List<String> list = [];
  StateListViewModel stateListViewModel = StateListViewModel();
  void _toggleCheck() {
    setState(() {
      check = !check;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        isDateSelected = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    stateListViewModel.fetchStateList(context).then((_) {
      setState(() {});
    });
    security_controller = TextEditingController();
    address1_controller = TextEditingController();
    address2_controller = TextEditingController();
    city_controller = TextEditingController();
    zip_controller = TextEditingController();
    security_focusnode = FocusNode();
    address1_focusnode = FocusNode();
    address2_focusnode = FocusNode();
    city_focusnode = FocusNode();
    zip_focusnode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    // if(stateListViewModel.loading == "success") {
    //   for (int i = 0; i < globalStateDataModel!.data!.length; i++) {
    //     list[i] = globalStateDataModel!.data![i].state.toString();
    //     print(globalStateDataModel!.data!.length);
    //   }
    // }
    final completeProfile1VM = Provider.of<CompleteProfile1ViewModel>(context);
    _dateController.text = isDateSelected ? _selectedDate.day.toString() : "DD";
    _monthController.text =
        isDateSelected ? _selectedDate.month.toString() : "MM";
    _yearController.text =
        isDateSelected ? _selectedDate.year.toString() : "YYYY";

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
              InkWell(
                onTap: () {
                  _key.currentState?.closeDrawer();
                },
                child: Align(
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
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomMenuBar(
                                      current_index: 0,
                                    )),
                          );
                        },
                        child: Container(
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
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomMenuBar(
                                      current_index: 1,
                                    )),
                          );
                        },
                        child: Container(
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
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomMenuBar(
                                      current_index: 2,
                                    )),
                          );
                        },
                        child: Container(
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
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomMenuBar(
                                      current_index: 3,
                                    )),
                          );
                        },
                        child: Container(
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
                                'assets/support.png',
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
                                'assets/invite.png',
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
                                'assets/msg.png',
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
                                'assets/setting.png',
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
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Container(
                          height: 18.h,
                          decoration: BoxDecoration(
                            color: gradient_color_light,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: gradient_color_light, width: 1),
                          ),
                          margin: EdgeInsets.only(
                              left: 20.h, top: 0.h, right: 10.h),
                          padding: EdgeInsets.only(left: 3, right: 3),
                          child: Center(
                            child: Text(
                              '1',
                              style: TextStyle(
                                color: white,
                                fontSize: 12.sp,
                                fontFamily: 'nunit_bold',
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Personal Details',
                          style: TextStyle(
                            color: black,
                            fontSize: 16.sp,
                            fontFamily: 'nunit_bold',
                          ),
                        ),
                        Container(
                          height: 18.h,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: gradient_color_light, width: 1),
                          ),
                          margin: EdgeInsets.only(
                              left: 10.h, top: 0.h, right: 10.h),
                          padding: EdgeInsets.only(left: 3, right: 3),
                          child: Center(
                            child: Text(
                              '2',
                              style: TextStyle(
                                color: gradient_color_light,
                                fontSize: 12.sp,
                                fontFamily: 'nunit_bold',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 18.h,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: gradient_color_light, width: 1),
                          ),
                          margin: EdgeInsets.only(
                              left: 10.h, top: 0.h, right: 10.h),
                          padding: EdgeInsets.only(left: 3, right: 3),
                          child: Center(
                            child: Text(
                              '3',
                              style: TextStyle(
                                color: gradient_color_light,
                                fontSize: 12.sp,
                                fontFamily: 'nunit_bold',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 18.h,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: gradient_color_light, width: 1),
                          ),
                          margin: EdgeInsets.only(
                              left: 10.h, top: 0.h, right: 10.h),
                          padding: EdgeInsets.only(left: 3, right: 3),
                          child: Center(
                            child: Text(
                              '4',
                              style: TextStyle(
                                color: gradient_color_light,
                                fontSize: 12.sp,
                                fontFamily: 'nunit_bold',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 18.h,
                          decoration: BoxDecoration(
                            color: white,
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
                                color: gradient_color_light,
                                fontSize: 12.sp,
                                fontFamily: 'nunit_bold',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Divider(
                      color: black,
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 20.h, left: 30.h, right: 30.h),
                      child: CommonTextField(
                          thecontroller: security_controller,
                          label: "Social Security Number",
                          type: TextInputType.number,
                          lines: 1,
                          secure: false,
                          fontSize: 18.sp,
                          text_color: black,
                          hint_color: gray),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                        child: Text(
                          'Date of Birth',
                          style: TextStyle(
                              color: black,
                              fontSize: 13.sp,
                              fontFamily: 'nunit_bold'),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 85,
                            margin: EdgeInsets.only(
                                top: 20.h, left: 15.h, right: 0.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: black, width: 1),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                      controller: _monthController,
                                      maxLines: 1,
                                      autofocus: false,
                                      enabled: false,
                                      cursorColor: black,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        color: black,
                                        fontFamily: "nunit_regular",
                                      ),
                                      onEditingComplete: () {
                                        // focusChange();
                                      },
                                      decoration: InputDecoration(
                                        focusedBorder: border,
                                        border: border,
                                        enabledBorder: border,
                                        disabledBorder: border,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0.0, horizontal: 10.0),
                                        hintText: "MM",
                                        hintStyle: TextStyle(
                                          fontSize: 18.sp,
                                          color: gray,
                                          fontFamily: "nunit_regular",
                                        ),
                                        suffixIconConstraints: BoxConstraints(
                                            maxHeight: 20, maxWidth: 30),
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            //loginController.pass_secure.value = !loginController.pass_secure.value;
                                          },
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 5),
                                              child: Image.asset(
                                                'assets/down_arrow.png',
                                              )),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 85,
                            margin: EdgeInsets.only(
                                top: 20.h, left: 15.h, right: 0.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: black, width: 1),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                      controller: _dateController,
                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      autofocus: false,
                                      enabled: false,
                                      cursorColor: black,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        color: black,
                                        fontFamily: "nunit_regular",
                                      ),
                                      onEditingComplete: () {
                                        // focusChange();
                                      },
                                      decoration: InputDecoration(
                                        focusedBorder: border,
                                        border: border,
                                        enabledBorder: border,
                                        disabledBorder: border,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0.0, horizontal: 10.0),
                                        hintText: "DD",
                                        hintStyle: TextStyle(
                                          fontSize: 18.sp,
                                          color: gray,
                                          fontFamily: "nunit_regular",
                                        ),
                                        suffixIconConstraints: BoxConstraints(
                                            maxHeight: 20, maxWidth: 30),
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            //loginController.pass_secure.value = !loginController.pass_secure.value;
                                          },
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 5),
                                              child: Image.asset(
                                                'assets/down_arrow.png',
                                              )),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: 20.h, left: 15.h, right: 15.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: black, width: 1),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                        controller: _yearController,
                                        maxLines: 1,
                                        autofocus: false,
                                        enabled: false,
                                        cursorColor: black,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          color: black,
                                          fontFamily: "nunit_regular",
                                        ),
                                        onEditingComplete: () {
                                          // focusChange();
                                        },
                                        decoration: InputDecoration(
                                          focusedBorder: border,
                                          border: border,
                                          enabledBorder: border,
                                          disabledBorder: border,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 0.0, horizontal: 10.0),
                                          hintText: "YYYY",
                                          hintStyle: TextStyle(
                                            fontSize: 18.sp,
                                            color: gray,
                                            fontFamily: "nunit_regular",
                                          ),
                                          suffixIconConstraints: BoxConstraints(
                                              maxHeight: 20, maxWidth: 30),
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              //loginController.pass_secure.value = !loginController.pass_secure.value;
                                            },
                                            child: Padding(
                                                padding:
                                                    EdgeInsets.only(right: 5),
                                                child: Image.asset(
                                                  'assets/down_arrow.png',
                                                )),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 20.h, left: 30.h, right: 30.h),
                      child: CommonTextField(
                          thecontroller: address1_controller,
                          label: "Address Line 1",
                          type: TextInputType.emailAddress,
                          lines: 1,
                          secure: false,
                          fontSize: 18.sp,
                          text_color: black,
                          hint_color: gray),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 20.h, left: 30.h, right: 30.h),
                      child: CommonTextField(
                          thecontroller: address2_controller,
                          label: "Address Line 2",
                          type: TextInputType.emailAddress,
                          lines: 1,
                          secure: false,
                          fontSize: 18.sp,
                          text_color: black,
                          hint_color: gray),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 20.h, left: 30.h, right: 30.h),
                            child: CommonTextField(
                                thecontroller: city_controller,
                                label: "City",
                                type: TextInputType.emailAddress,
                                lines: 1,
                                secure: false,

                                fontSize: 18.sp,
                                text_color: black,
                                hint_color: gray),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 20.h, left: 15.h, right: 30.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: black, width: 1),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                      maxLines: 1,
                                      autofocus: false,
                                      enabled: false,
                                      cursorColor: black,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        color: black,
                                        fontFamily: "nunit_regular",
                                      ),
                                      onEditingComplete: () {
                                        // focusChange();
                                      },
                                      decoration: InputDecoration(
                                        focusedBorder: border,
                                        border: border,
                                        enabledBorder: border,
                                        disabledBorder: border,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0.0, horizontal: 15.0),
                                        hintText: "State",
                                        hintStyle: TextStyle(
                                          fontSize: 18.sp,
                                          color: gray,
                                          fontFamily: "nunit_regular",
                                        ),
                                        suffixIconConstraints: BoxConstraints(
                                            maxHeight: 20, maxWidth: 30),
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            //loginController.pass_secure.value = !loginController.pass_secure.value;
                                          },
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 5),
                                              child: Image.asset(
                                                'assets/down_arrow.png',
                                              )),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 20.h, left: 30.h, right: 30.h),
                      child: CommonTextField(
                          thecontroller: zip_controller,
                          label: "Zipcode",
                          type: TextInputType.emailAddress,
                          lines: 1,
                          secure: false,

                          fontSize: 18.sp,
                          text_color: black,
                          hint_color: gray),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 20.h, left: 20.h, right: 20.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(top: 3, left: 0.h, right: 5.h),
                            child: InkWell(
                              onTap: _toggleCheck,
                              child: Center(
                                child: Container(
                                    width: 25.h,
                                    height: 25.h,
                                    margin:
                                        EdgeInsets.only(left: 0.h, right: 10.h),
                                    decoration: BoxDecoration(
                                        color: check
                                            ? Color(0xFF0075B2)
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: check
                                            ? null
                                            : Border.all(color: Colors.grey)),
                                    child: Icon(
                                      Icons.check,
                                      size: 20,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Text(
                                'To meet facilities’ background check requirements for working a shift there, I hereby authorize Click & Staff to use my personally identifiable date(name, SSN,DOB, and address) through its agents, to conduct an appropriate background investigation of me and prepare a consumer report or investigative consumer report, which will be used solely as a factor for facilities to determine my eligibility for working a shift as governed by the Fair Credit Reporting Act Public Law 91-508',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: gray,
                                    fontSize: 14.sp,
                                    fontFamily: 'nunit_regular'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Center(
                        child: completeProfile1VM.loading
                            ? CircularProgressIndicator()
                            : CommonButtonWithPadding(
                                label: 'NEXT',
                                onPressed: () async {
                                  Map data = {
                                    "user_id": "224",
                                    "social_security_number": "123322",
                                    "birth_date": _dateController.text,
                                    "birth_month": _monthController.text,
                                    "birth_year": _yearController.text,
                                    "address_line1":
                                        address1_controller.text.toString(),
                                    "address_line2":
                                        address2_controller.text.toString(),
                                    "city": city_controller.text.toString(),
                                    "state": "LA",
                                    "zipcode": zip_controller.text,
                                    "profile_chk": check
                                  };
                                  if (_dateController.value.text.isNotEmpty &&
                                      _monthController.value.text.isNotEmpty &&
                                      _yearController.value.text.isNotEmpty &&
                                      address1_controller
                                          .value.text.isNotEmpty &&
                                      address2_controller
                                          .value.text.isNotEmpty &&
                                      city_controller.value.text.isNotEmpty &&
                                      zip_controller.value.text.isNotEmpty) {
                                    await completeProfile1VM
                                        .postCompleteProfile1Api(data, context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => W9Form()));
                                  } else if (!check) {
                                    Utils.showSnackBar(
                                        context,
                                        "Agree with terms & conditions!",
                                        Colors.red);
                                  } else {
                                    Utils.showSnackBar(context,
                                        "Some fields are empty!", Colors.red);
                                  }
                                },
                                border: 35.h,
                                height: 50.h,
                                fontSize: 18,
                                textColor: white,
                                backgroundColor: black),
                      ),
                    ),
                    SizedBox(height: 30.h),
                  ],
                )),
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
