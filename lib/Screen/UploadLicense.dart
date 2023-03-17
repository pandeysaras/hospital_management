import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medteam/Components/CommonButton.dart';
import 'package:medteam/Components/CommonButtonWhite.dart';
import 'package:medteam/Components/CommonButtonWithPadding.dart';
import 'package:medteam/Components/CommonTextField.dart';
import 'package:medteam/Screen/BottomMenuBar.dart';
import 'package:medteam/Screen/PaymentMethod.dart';
import 'package:medteam/Utils/colors.dart';
import 'package:medteam/Utils/dropDown.dart';
import 'package:medteam/view_model/sign_up_view_models/profile_view_model.dart';
import 'package:provider/provider.dart';

import '../model/licence_list_model.dart';

class UploadLicense extends StatefulWidget {
  @override
  _UploadLicenseState createState() => _UploadLicenseState();
}

class _UploadLicenseState extends State<UploadLicense> {
  late double screenWidth, screenHeight;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  TextEditingController licensedByController = TextEditingController();
  TextEditingController license_no_controller = TextEditingController();

  TextEditingController expdateCtrlr = TextEditingController();
  TextEditingController issuedateCtrlr = TextEditingController();

  FocusNode mobile_focusnode = FocusNode();
  FocusNode license_no_focusnode = FocusNode();

  String gender = "male";
  String licenseType = "";
  String state = '';

  bool isImage = false;

  @override
  void initState() {
    super.initState();
    // fillList();
    context.read<ProfileViewModel>().listOfLicesnesAPI(context);

    context.read<ProfileViewModel>().listOfStatesAPI(context);
    // licensedBy = TextEditingController();
    // license_no_controller = TextEditingController();
    // mobile_focusnode = FocusNode();
    // license_no_focusnode = FocusNode();
  }

  // List<String> listOfLicenseTypes = [];

  // void fillList() async {
  //   await context.read<ProfileViewModel>().listOfLicesnesAPI(context);
  //   for (int i = 1; i < globalLicenseListModel!.data!.length - 1; i++) {
  //     listOfLicenseTypes[i] = globalLicenseListModel!.data![i].name.toString();
  //     // context.read<ProfileViewModel>().notifyListeners();
  //   }
  //   context.read<ProfileViewModel>().notifyListeners();
  // }

  //---------------drop down

  String _selectedOption = 'opt';
// List<String> _options = ['Option 1', 'Option 2', 'Option 3'];

  // Widget dpOpen(BuildContext context) {
  //   return DropdownButton<String>(
  //     value: _selectedOption,
  //     onChanged: (newValue) {
  //       setState(() {
  //         _selectedOption = newValue!;
  //       });
  //     },
  //     items: listOfLicenseTypes.map((option) {
  //       return DropdownMenuItem<String>(
  //         value: option,
  //         child: Text(option),
  //       );
  //     }).toList(),
  //   );
  // }

//---------------upload-------------
  File? file;

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      print("---------------------picked");
      file = File(
        result.files.single.path!,
      );

      setState(() {
        isImage = true;
      });
    } else {
      print("No pi");
      setState(() {
        isImage = false;
      });
      // User canceled the picker
    }
  }

  //---------------------------
  DateTime _selectedDate = DateTime.now();

  DateTime _eselectedDate = DateTime.now();
  bool isDateSelected = false;

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        issuedateCtrlr.text = _selectedDate.toString().substring(0, 11);
        _selectedDate = picked;
        isDateSelected = true;
      });
    }
  }

  Future<void> _expselectDate(BuildContext context) async {
    DateTime? epicked = await showDatePicker(
        context: context,
        initialDate: _eselectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));
    if (epicked != null && epicked != _eselectedDate) {
      setState(() {
        expdateCtrlr.text = _eselectedDate.toString().substring(0, 11);
        _eselectedDate = epicked;
        isDateSelected = true;
      });
    }
  }

//-----------------
  @override
  Widget build(BuildContext context) {
    // print(listOfLicenseTypes[1]);
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
                              ),
                            ),
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
                            margin: EdgeInsets.only(
                                left: 20.h, top: 0.h, right: 0.h),
                            padding: EdgeInsets.only(left: 3, right: 3),
                            child: Center(
                                child: Image.asset(
                              'assets/green_check_icon.png',
                            )),
                          ),
                          Container(
                            height: 18.h,
                            margin: EdgeInsets.only(
                                left: 10.h, top: 0.h, right: 0.h),
                            padding: EdgeInsets.only(left: 3, right: 3),
                            child: Center(
                                child: Image.asset(
                              'assets/green_check_icon.png',
                            )),
                          ),
                          Container(
                            height: 18.h,
                            margin: EdgeInsets.only(
                                left: 10.h, top: 0.h, right: 0.h),
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
                                '4',
                                style: TextStyle(
                                  color: white,
                                  fontSize: 12.sp,
                                  fontFamily: 'nunit_bold',
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'License',
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
                      SizedBox(height: 15),
                      Stack(
                        children: [
                          Center(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 2.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  isImage == true
                                      ? Image.file(
                                          file!,
                                          width: 70.h,
                                          height: 80.h,
                                          fit: BoxFit.contain,
                                        )
                                      : Image.asset(
                                          'assets/license.png',
                                          width: 70.h,
                                          height: 80.h,
                                          fit: BoxFit.contain,
                                        ),
                                  Text(
                                    'Professional License',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 10.sp,
                                        fontFamily: 'nunit_regular'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 108),
                              child: CommonButton(
                                label: 'Upload',
                                onPressed: () async {
                                  pickFile();
                                },
                                border: 35.h,
                                height: 40.h,
                                fontSize: 18,
                                textColor: white,
                                backgroundColor: black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(top: 20.h, left: 30.h, right: 30.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: black, width: 1),
                        ),
                        child: Row(
                          children: [
                            context
                                    .watch<ProfileViewModel>()
                                    .listOfLicenseTypes
                                    .isEmpty
                                ? Expanded(
                                    child: const LinearProgressIndicator(),
                                  )
                                : Expanded(
                                    // width: 300,
                                    child: DropdownSearch<String>(
                                      popupProps: PopupProps.menu(
                                        showSelectedItems: true,
                                        disabledItemFn: (String s) =>
                                            s.startsWith('I'),
                                      ),
                                      items: context
                                          .read<ProfileViewModel>()
                                          .listOfLicenseTypes,
                                      dropdownDecoratorProps:
                                          DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                            left: 20,
                                            top: 13,
                                          ),
                                          border: InputBorder.none,
                                          hintText: "License Type",
                                        ),
                                      ),
                                      onChanged: (value) {
                                        print(value);
                                        licenseType = value.toString();
                                      },
                                      // selectedItem: context
                                      //     .read<ProfileViewModel>()
                                      //     .listOfLicenseTypes
                                      //     .first,
                                    ),
                                  ),
                          ],
                        ),
                        // child: Row(
                        //   children: [

                        //     // Expanded(
                        //     //   child: InkWell(
                        //     //     onTap: () {
                        //     //       // dpOpen(context);
                        //     //       // print("tapped");
                        //     //       // setState(() {});
                        //     //     },
                        //     //     child: Container(
                        //     //       margin:
                        //     //           EdgeInsets.only(left: 20.h, right: 20.w),
                        //     //       child: TextField(
                        //     //         maxLines: 1,
                        //     //         autofocus: false,
                        //     //         enabled: false,
                        //     //         cursorColor: black,
                        //     //         style: TextStyle(
                        //     //           fontSize: 18.sp,
                        //     //           color: black,
                        //     //           fontFamily: "nunit_regular",
                        //     //         ),
                        //     //         onEditingComplete: () {
                        //     //           // focusChange();
                        //     //         },
                        //     //         decoration: InputDecoration(
                        //     //           focusedBorder: border,
                        //     //           border: border,
                        //     //           enabledBorder: border,
                        //     //           disabledBorder: border,
                        //     //           contentPadding: EdgeInsets.symmetric(
                        //     //               vertical: 0.0, horizontal: 0.0),
                        //     //           hintText: "License Type",
                        //     //           hintStyle: TextStyle(
                        //     //             fontSize: 18.sp,
                        //     //             color: gray,
                        //     //             fontFamily: "nunit_regular",
                        //     //           ),
                        //     //           suffixIconConstraints: BoxConstraints(
                        //     //               maxHeight: 20, maxWidth: 30),
                        //     //           suffixIcon: GestureDetector(
                        //     //             onTap: () {
                        //     //               //loginController.pass_secure.value = !loginController.pass_secure.value;
                        //     //             },
                        //     //             child: Padding(
                        //     //                 padding: EdgeInsets.only(right: 5),
                        //     //                 child: Image.asset(
                        //     //                   'assets/down_arrow.png',
                        //     //                   color: black,
                        //     //                 )),
                        //     //           ),
                        //     //         ),
                        //     //       ),
                        //     //     ),

                        //     //   ),
                        //     // ),
                        //     //-------------type
                        //   ],
                        // ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(top: 20.h, left: 30.h, right: 30.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: black, width: 1),
                        ),
                        child: Row(
                          children: [
                            context
                                    .watch<ProfileViewModel>()
                                    .listOfLicenseTypes
                                    .isEmpty
                                ? Expanded(
                                    child: const LinearProgressIndicator(),
                                  )
                                : Expanded(
                                    // width: 300,
                                    child: DropdownSearch<String>(
                                      popupProps: PopupProps.menu(
                                        showSelectedItems: true,
                                        disabledItemFn: (String s) =>
                                            s.startsWith('I'),
                                      ),
                                      items: context
                                          .read<ProfileViewModel>()
                                          .listStates,
                                      dropdownDecoratorProps:
                                          DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                            left: 20,
                                            top: 13,
                                          ),
                                          border: InputBorder.none,
                                          // labelText: "Menu mode",
                                          hintText: "State",
                                        ),
                                      ),
                                      onChanged: (value) {
                                        print(value);
                                        state = value.toString();
                                      },
                                      // selectedItem: "State",
                                    ),
                                  ),
                            // Expanded(
                            //   child: Container(
                            //     margin:
                            //         EdgeInsets.only(left: 20.h, right: 20.w),
                            //     child: TextField(
                            //       maxLines: 1,
                            //       autofocus: false,
                            //       enabled: false,
                            //       cursorColor: black,
                            //       style: TextStyle(
                            //         fontSize: 18.sp,
                            //         color: black,
                            //         fontFamily: "nunit_regular",
                            //       ),
                            //       onEditingComplete: () {
                            //         // focusChange();
                            //       },
                            //       decoration: InputDecoration(
                            //         focusedBorder: border,
                            //         border: border,
                            //         enabledBorder: border,
                            //         disabledBorder: border,
                            //         contentPadding: EdgeInsets.symmetric(
                            //             vertical: 0.0, horizontal: 0.0),
                            //         hintText: "State",
                            //         hintStyle: TextStyle(
                            //           fontSize: 18.sp,
                            //           color: gray,
                            //           fontFamily: "nunit_regular",
                            //         ),
                            //         suffixIconConstraints: BoxConstraints(
                            //             maxHeight: 20, maxWidth: 30),
                            //         suffixIcon: GestureDetector(
                            //           onTap: () {
                            //             //loginController.pass_secure.value = !loginController.pass_secure.value;
                            //           },
                            //           child: Padding(
                            //             padding: EdgeInsets.only(right: 5),
                            //             child: Image.asset(
                            //               'assets/down_arrow.png',
                            //               color: black,
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(top: 20.h, left: 30.h, right: 30.h),
                        child: CommonTextField(
                          thecontroller: license_no_controller,
                          label: "License Number",
                          type: TextInputType.text,
                          lines: 1,
                          secure: false,
                          fontSize: 18.sp,
                          text_color: black,
                          hint_color: gray,
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(top: 20.h, left: 30.h, right: 30.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: black, width: 1),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  _selectDate(context);
                                },
                                child: Container(
                                  margin:
                                      EdgeInsets.only(left: 20.h, right: 20.w),
                                  child: TextField(
                                      controller: issuedateCtrlr,
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
                                            vertical: 0.0, horizontal: 0.0),
                                        hintText: "License Issue Date",
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
                                                'assets/calender.png',
                                              )),
                                        ),
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(top: 20.h, left: 30.h, right: 30.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: black, width: 1),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  _expselectDate(context);
                                },
                                child: Container(
                                  margin:
                                      EdgeInsets.only(left: 20.h, right: 20.w),
                                  child: TextField(
                                      maxLines: 1,
                                      controller: expdateCtrlr,
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
                                            vertical: 0.0, horizontal: 0.0),
                                        hintText: "Expiration Date",
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
                                                'assets/calender.png',
                                              )),
                                        ),
                                      )),
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
                            thecontroller: licensedByController,
                            label: "Licensed By",
                            type: TextInputType.emailAddress,
                            lines: 1,
                            secure: false,
                            fontSize: 18.sp,
                            text_color: black,
                            hint_color: gray),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'Is the License in Good Standing ?',
                        style: TextStyle(
                            color: black,
                            fontSize: 15.sp,
                            fontFamily: 'nunit_extrabold'),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 50.w,
                          ),
                          Radio(
                              groupValue: gender,
                              value: "Yes",
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) => gray),
                              activeColor: Colors.black,
                              onChanged: (value) {
                                print(value);
                                setState(() {
                                  setState(() {
                                    gender = value.toString();
                                  });
                                });
                              }),
                          Text(
                            'Yes',
                            style: TextStyle(
                                color: black,
                                fontSize: 15.sp,
                                fontFamily: 'nunit_extrabold'),
                          ),
                          Radio(
                              groupValue: gender,
                              value: "No",
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) => gray),
                              activeColor: Colors.black,
                              onChanged: (value) {
                                print(value);
                                setState(() {
                                  gender = value.toString();
                                });
                              }),
                          Text(
                            'No',
                            style: TextStyle(
                                color: black,
                                fontSize: 15.sp,
                                fontFamily: 'nunit_extrabold'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 40.h, right: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CommonButtonWhite(
                                label: 'PREV',
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
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
                                      await context
                                          .read<ProfileViewModel>()
                                          .updateLicence(
                                            file!,
                                            context,
                                            licenseType,
                                            state,
                                            license_no_controller.value.text,
                                            licensedByController.value.text,
                                            issuedateCtrlr.value.text,
                                            expdateCtrlr.value.text,
                                          );
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PaymentMethod(),
                                        ),
                                      );
                                    },
                                    border: 35.h,
                                    height: 50.h,
                                    fontSize: 18,
                                    textColor: white,
                                    backgroundColor: black,
                                  ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
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
