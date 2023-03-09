import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medteam/Components/CommonButton.dart';
import 'package:medteam/Components/CommonButtonWhite.dart';
import 'package:medteam/Components/CommonTextField.dart';
import 'package:medteam/Screen/BottomMenuBar.dart';
import 'package:medteam/Screen/SortResultBy.dart';
import 'package:medteam/Utils/colors.dart';

class FindWorkBySort extends StatefulWidget {
  @override
  _FindWorkBySortState createState() => _FindWorkBySortState();
}

class _FindWorkBySortState extends State<FindWorkBySort> {
  late double screenWidth, screenHeight;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
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
      key: _key,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
          title: Text(
            'Find Work',
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
            gradient: LinearGradient(colors: [Color(0xFF0075B2),Color(0xFF3BA9E2)]),
          ),
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  _key.currentState?.closeDrawer();
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.only(top:35,left: 5,right: 5),
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
                  margin: EdgeInsets.only(top:5,left: 5,right: 5),
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    'assets/user.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Expanded(
                child: Container(
                  color: white,
                  padding: EdgeInsets.only(top: 20.h),
                  child: ListView(
                    // Important: Remove any padding from the ListView.
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      InkWell(
                        onTap:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BottomMenuBar(current_index: 0,)),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.only(top:8,bottom: 8),
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
                              SizedBox(width: 15,),
                              Container(
                                margin: EdgeInsets.only(left: 5,right: 30),
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
                      SizedBox(height: 15,),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BottomMenuBar(current_index: 1,)),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.only(top:8,bottom: 8),
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
                              SizedBox(width: 15,),
                              Container(
                                margin: EdgeInsets.only(left: 5,right: 30),
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

                      SizedBox(height: 15,),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BottomMenuBar(current_index: 2,)),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.only(top:8,bottom: 8),
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
                              SizedBox(width: 15,),
                              Container(
                                margin: EdgeInsets.only(left: 5,right: 30),
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
                      SizedBox(height: 15,),
                      InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BottomMenuBar(current_index: 3,)),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.only(top:8,bottom: 8),
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
                              SizedBox(width: 15,),
                              Container(
                                margin: EdgeInsets.only(left: 5,right: 30),
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

                      SizedBox(height: 15,),
                      Container(
                        padding: EdgeInsets.only(top:8,bottom: 8),
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
                            SizedBox(width: 15,),
                            Container(
                              margin: EdgeInsets.only(left: 5,right: 30),
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

                      SizedBox(height: 15,),
                      Container(
                        padding: EdgeInsets.only(top:8,bottom: 8),
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
                            SizedBox(width: 15,),
                            Container(
                              margin: EdgeInsets.only(left: 5,right: 30),
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

                      SizedBox(height: 15,),
                      Container(
                        padding: EdgeInsets.only(top:8,bottom: 8),
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
                            SizedBox(width: 15,),
                            Container(
                              margin: EdgeInsets.only(left: 5,right: 30),
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

                      SizedBox(height: 15,),
                      Container(
                        padding: EdgeInsets.only(top:8,bottom: 8),
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
                            SizedBox(width: 15,),
                            Container(
                              margin: EdgeInsets.only(left: 5,right: 30),
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
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    color: app_text_color,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Container(
                         margin: EdgeInsets.only(top: 10),
                         child: Center(
                           child:  Container(
                             margin:
                             EdgeInsets.only(top: 20.h, left: 30.h,right: 30.h),
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(25),
                               border: Border.all(color: black, width: 1),
                               color: white
                             ),
                             child:Row(
                               children: [
                                 Expanded(
                                   child: Container(
                                     margin: EdgeInsets.only(left: 20.h,right: 20.w),
                                     child: TextField(
                                         maxLines: 1,
                                         keyboardType: TextInputType.text,
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
                                         controller: mobile_controller,
                                         focusNode: mobile_focusnode,
                                         onEditingComplete: () {
                                           // focusChange();
                                         },
                                         decoration: InputDecoration(
                                           focusedBorder: border,
                                           border: border,
                                           enabledBorder: border,
                                           disabledBorder: border,
                                           contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                                           hintText: "Search Here",
                                           hintStyle: TextStyle(
                                             fontSize: 18.sp,
                                             color: gray,
                                             fontFamily: "nunit_regular",
                                           ),
                                           prefixIconConstraints:BoxConstraints(
                                               maxHeight: 20,
                                               maxWidth: 30) ,
                                           prefixIcon: GestureDetector(
                                             onTap: () {

                                               //loginController.pass_secure.value = !loginController.pass_secure.value;
                                             },
                                             child: Padding(
                                                 padding: EdgeInsets.only(
                                                     right: 15),
                                                 child:  Image.asset(
                                                   'assets/search_icon.png',
                                                 )
                                             ),
                                           ),
                                         )),
                                   ),
                                 ),


                               ],
                             ),
                           ),
                         ),
                       ),

                      Container(
                        width: screenWidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(40),
                                topRight: Radius.circular(40)),
                            border: Border.all(color: black, width: 1),
                            color: white
                        ),
                        child: SizedBox(
                          child: Column(
                            children: [
                              InkWell(
                                onTap: (){
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
                                      return
                                        SingleChildScrollView(
                                          child: Container(
                                            child: Column(
                                              children: [
                                                SizedBox(height: 10,),
                                                Stack(
                                                    children:[
                                                      InkWell(
                                                        onTap:(){
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: Container(
                                                          margin:EdgeInsets.only(left: 20),
                                                          child: Align(
                                                            alignment:Alignment.topLeft,
                                                            child: Text(
                                                              'Close',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                  color: app_text_color,
                                                                  fontSize: 16.sp,
                                                                  fontFamily: 'nunit_regular'),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:Alignment.topCenter,
                                                     child: Text(
                                                  'Search Preference',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                        color: black,
                                                        fontSize: 19.sp,
                                                        fontFamily: 'nunit_extrabold'),
                                                ),
                                                   ),
                                                  ]

                                                ),
                                                Container(
                                              margin: EdgeInsets.only(top: 20.h, left: 40.h,right: 30.h),
                                                  child: Align(
                                                    alignment:Alignment.topLeft,
                                                    child: Text(
                                                      'Key Word',
                                                      style: TextStyle(
                                                          color: black,
                                                          fontSize: 14.sp,
                                                          fontFamily: 'nunit_bold'),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                  EdgeInsets.only(top: 5.h, left: 30.h,right: 30.h),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(25),
                                                    border: Border.all(color: black, width: 1),
                                                  ),
                                                  child:Row(
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          margin: EdgeInsets.only(left: 20.h,right: 20.w),
                                                          child: TextField(
                                                              maxLines: 1,
                                                              keyboardType: TextInputType.text,
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
                                                              controller: mobile_controller,
                                                              focusNode: mobile_focusnode,
                                                              onEditingComplete: () {
                                                                // focusChange();
                                                              },
                                                              decoration: InputDecoration(
                                                                focusedBorder: border,
                                                                border: border,
                                                                enabledBorder: border,
                                                                disabledBorder: border,
                                                                contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                                                                hintText: "",
                                                                hintStyle: TextStyle(
                                                                  fontSize: 18.sp,
                                                                  color: gray,
                                                                  fontFamily: "nunit_regular",
                                                                ),
                                                                suffixIconConstraints:BoxConstraints(
                                                                    maxHeight: 20,
                                                                    maxWidth: 30) ,
                                                                suffixIcon: GestureDetector(
                                                                  onTap: () {

                                                                    //loginController.pass_secure.value = !loginController.pass_secure.value;
                                                                  },
                                                                  child: Padding(
                                                                      padding: EdgeInsets.only(
                                                                          right: 5),
                                                                      child:  Image.asset(
                                                                        'assets/down_arrow.png',
                                                                      )
                                                                  ),
                                                                ),
                                                              )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(top: 15.h, left: 40.h,right: 30.h),
                                                  child: Align(
                                                    alignment:Alignment.topLeft,
                                                    child: Text(
                                                      'Date Range',
                                                      style: TextStyle(
                                                          color: black,
                                                          fontSize: 14.sp,
                                                          fontFamily: 'nunit_bold'),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex:1,
                                                      child: Container(
                                                        margin:
                                                        EdgeInsets.only(top: 5.h, left: 30.h,right: 0.h),
                                                        child: CommonTextField(
                                                            thecontroller: mobile_controller,
                                                            label: "",
                                                            type: TextInputType.emailAddress,
                                                            action: TextInputAction.next,
                                                            lines: 1,
                                                            secure: false,
                                                            focusChange: () {
                                                              mobile_focusnode.unfocus();
                                                            },
                                                            fontSize: 18.sp,
                                                            focusNode: mobile_focusnode,
                                                            text_color: black,
                                                            hint_color:gray
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin:
                                                      EdgeInsets.only(top: 5.h, left: 10.h,right: 10.h),
                                                      child: Text('to',
                                                        style: TextStyle(
                                                            color: black,
                                                            fontSize: 15.sp,
                                                            fontFamily: 'nunit_bold'),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex:1,
                                                      child: Container(
                                                        margin:
                                                        EdgeInsets.only(top: 5.h, left: 0.h,right: 30.h),
                                                        child: CommonTextField(
                                                            thecontroller: mobile_controller,
                                                            label: "",
                                                            type: TextInputType.emailAddress,
                                                            action: TextInputAction.next,
                                                            lines: 1,
                                                            secure: false,
                                                            focusChange: () {
                                                              mobile_focusnode.unfocus();
                                                            },
                                                            fontSize: 18.sp,
                                                            focusNode: mobile_focusnode,
                                                            text_color: black,
                                                            hint_color:gray
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(top: 15.h, left: 40.h,right: 30.h),
                                                  child: Align(
                                                    alignment:Alignment.topLeft,
                                                    child: Text(
                                                      'Shift Schedule types',
                                                      style: TextStyle(
                                                          color: black,
                                                          fontSize: 14.sp,
                                                          fontFamily: 'nunit_bold'),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex:1,
                                                      child: Container(
                                                        margin:
                                                        EdgeInsets.only(top: 5.h, left: 30.h,right: 0.h),
                                                        padding: EdgeInsets.only(top: 15,bottom: 15,left: 5,right: 5),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(25),
                                                          border: Border.all(color: black, width: 1),
                                                        ),
                                                        child: Text(
                                                          'Day',
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                              color: gray,
                                                              fontSize: 14.sp,
                                                              fontFamily: 'nunit_bold'),
                                                        ),
                                                      ),
                                                    ),

                                                    Expanded(
                                                      flex:1,
                                                      child: Container(
                                                        margin:
                                                        EdgeInsets.only(top: 5.h, left: 10.h,right: 10.h),
                                                        padding: EdgeInsets.only(top: 15,bottom: 15,left: 5,right: 5),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(25),
                                                          border: Border.all(color: black, width: 1),
                                                        ),
                                                        child: Text(
                                                          'Evening',
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                              color: gray,
                                                              fontSize: 14.sp,
                                                              fontFamily: 'nunit_bold'),
                                                        ),
                                                      ),
                                                    ),Expanded(
                                                      flex:1,
                                                      child:
                                                      Container(
                                                        margin:
                                                        EdgeInsets.only(top: 5.h, left: 0.h,right: 30.h),
                                                        padding: EdgeInsets.only(top: 15,bottom: 15,left: 5,right: 5),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(25),
                                                          border: Border.all(color: black, width: 1),
                                                        ),
                                                        child: Text(
                                                          'Overnight',
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                              color: gray,
                                                              fontSize: 14.sp,
                                                              fontFamily: 'nunit_bold'),
                                                        ),

                                                      ),

                                                    ),
                                                  ],
                                                ),

                                                Container(
                                                  margin: EdgeInsets.only(top: 15.h, left: 40.h,right: 30.h),
                                                  child: Align(
                                                    alignment:Alignment.topLeft,
                                                    child: Text(
                                                      'Location',
                                                      style: TextStyle(
                                                          color: black,
                                                          fontSize: 14.sp,
                                                          fontFamily: 'nunit_bold'),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                  EdgeInsets.only(top: 5.h, left: 30.h,right: 30.h),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(25),
                                                    border: Border.all(color: black, width: 1),
                                                  ),
                                                  child:Row(
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          margin: EdgeInsets.only(left: 20.h,right: 20.w),
                                                          child: TextField(
                                                              maxLines: 1,
                                                              keyboardType: TextInputType.text,
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
                                                              controller: mobile_controller,
                                                              focusNode: mobile_focusnode,
                                                              onEditingComplete: () {
                                                                // focusChange();
                                                              },
                                                              decoration: InputDecoration(
                                                                focusedBorder: border,
                                                                border: border,
                                                                enabledBorder: border,
                                                                disabledBorder: border,
                                                                contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                                                                hintText: "Current Location",
                                                                hintStyle: TextStyle(
                                                                  fontSize: 18.sp,
                                                                  color: gray,
                                                                  fontFamily: "nunit_regular",
                                                                ),
                                                                suffixIconConstraints:BoxConstraints(
                                                                    maxHeight: 20,
                                                                    maxWidth: 30) ,
                                                                suffixIcon: GestureDetector(
                                                                  onTap: () {

                                                                    //loginController.pass_secure.value = !loginController.pass_secure.value;
                                                                  },
                                                                  child: Padding(
                                                                      padding: EdgeInsets.only(
                                                                          right: 5),
                                                                      child:  Image.asset(
                                                                        'assets/down_arrow.png',
                                                                      )
                                                                  ),
                                                                ),
                                                              )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(top: 15.h, left: 40.h,right: 30.h),
                                                  child: Align(
                                                    alignment:Alignment.topLeft,
                                                    child: Text(
                                                      'Distance',
                                                      style: TextStyle(
                                                          color: black,
                                                          fontSize: 14.sp,
                                                          fontFamily: 'nunit_bold'),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                  EdgeInsets.only(top: 5.h, left: 30.h,right: 30.h),
                                                  child: CommonTextField(
                                                      thecontroller: mobile_controller,
                                                      label: "30 Miles",
                                                      type: TextInputType.emailAddress,
                                                      action: TextInputAction.next,
                                                      lines: 1,
                                                      secure: false,
                                                      focusChange: () {
                                                        mobile_focusnode.unfocus();
                                                      },
                                                      fontSize: 18.sp,
                                                      focusNode: mobile_focusnode,
                                                      text_color: black,
                                                      hint_color:gray
                                                  ),
                                                ),

                                                Container(
                                                  margin: EdgeInsets.only(top: 15.h, left: 40.h,right: 30.h),
                                                  child: Align(
                                                    alignment:Alignment.topLeft,
                                                    child: Text(
                                                      'By Facility',
                                                      style: TextStyle(
                                                          color: black,
                                                          fontSize: 14.sp,
                                                          fontFamily: 'nunit_bold'),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                  EdgeInsets.only(top: 5.h, left: 30.h,right: 30.h),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(25),
                                                    border: Border.all(color: black, width: 1),
                                                  ),
                                                  child:Row(
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          margin: EdgeInsets.only(left: 20.h,right: 20.w),
                                                          child: TextField(
                                                              maxLines: 1,
                                                              keyboardType: TextInputType.text,
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
                                                              controller: mobile_controller,
                                                              focusNode: mobile_focusnode,
                                                              onEditingComplete: () {
                                                                // focusChange();
                                                              },
                                                              decoration: InputDecoration(
                                                                focusedBorder: border,
                                                                border: border,
                                                                enabledBorder: border,
                                                                disabledBorder: border,
                                                                contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                                                                hintText: "All",
                                                                hintStyle: TextStyle(
                                                                  fontSize: 18.sp,
                                                                  color: gray,
                                                                  fontFamily: "nunit_regular",
                                                                ),
                                                                suffixIconConstraints:BoxConstraints(
                                                                    maxHeight: 20,
                                                                    maxWidth: 30) ,
                                                                suffixIcon: GestureDetector(
                                                                  onTap: () {

                                                                    //loginController.pass_secure.value = !loginController.pass_secure.value;
                                                                  },
                                                                  child: Padding(
                                                                      padding: EdgeInsets.only(
                                                                          right: 5),
                                                                      child:  Image.asset(
                                                                        'assets/down_arrow.png',
                                                                      )
                                                                  ),
                                                                ),
                                                              )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                                Container(
                                                  margin: EdgeInsets.only(top:20.h,left: 35.h,right: 35.h),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      CommonButtonWhite(
                                                          label: 'RESET',
                                                          onPressed: () async {},
                                                          border: 35.h,
                                                          height: 50.h,
                                                          fontSize: 18,
                                                          textColor: black,
                                                          backgroundColor: black),
                                                      CommonButton(
                                                          label: 'APPLY',
                                                          onPressed: () async {
                                                            Navigator.of(context).pop();
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(builder: (context) => SortResultBy()),
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
                                                SizedBox(height: 30,),
                                              ],
                                            ),


                                          ),
                                        );
                                    },
                                  );
                                },
                                child: Container(
                                  width: screenWidth,
                                  margin:
                                  EdgeInsets.only(top: 35.h, left: 30.h,right: 30.h,bottom: 35),
                                  padding:  EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(color: black, width: 1),
                                  ),
                                  child: Text(
                                    'Sort By',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                      color: gray,
                                      fontSize: 18.sp,
                                      fontFamily: 'nunit_bold'),
                                  ),

                                ),
                              ),

                            ],
                          ),
                        ),


                      )

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final border = UnderlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide.none,
  );
}
