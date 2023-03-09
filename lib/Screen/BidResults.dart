
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medteam/Components/CommonButton.dart';
import 'package:medteam/Components/CommonButtonWhite.dart';
import 'package:medteam/Components/CommonTextField.dart';
import 'package:medteam/Screen/BottomMenuBar.dart';
import 'package:medteam/Utils/colors.dart';

import 'CompletedShiftDetail.dart';
import 'OnGoinShifts.dart';

class BidResults extends StatefulWidget {
  @override
  _BidResultsState createState() => _BidResultsState();
}

class _BidResultsState extends State<BidResults> {
  late double screenWidth, screenHeight;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  String selectedType="accepted";

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    ScreenUtil.init(context, designSize: Size(screenWidth, screenHeight));

    return Scaffold(
      key: _key,
      backgroundColor:color_box_bg.withOpacity(.8),
      appBar: AppBar(
          title: Text(
            'Bid Results',
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

        child: SingleChildScrollView(
          child: Column(
            children: [
             Container(
                  color: color_box_bg,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(top: 10,bottom: 10),
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                selectedType="accepted";
                              });

                            },
                            child: Text(
                              'Accepted',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color:   selectedType=="accepted"?Colors.blue:black,
                                  fontSize: 15.sp,
                                  fontFamily: 'nunit_regular'),

                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        child: VerticalDivider(
                          color: app_text_color,
                          thickness: 1,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(top: 10,bottom: 10),
                          child:InkWell(
                            onTap: (){
                              setState(() {
                                selectedType="reject";
                              });

                            },
                            child: Text(
                            'Rejected',
                            textAlign: TextAlign.center,

                            style: TextStyle(
                                color:selectedType=="reject"?Colors.blue:black,
                                fontSize: 15.sp,
                                fontFamily: 'nunit_regular'),

                          )),
                        ),
                      ),
                      Container(
                        height: 50,
                        child: VerticalDivider(
                          color: app_text_color,
                          thickness: 1,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(top: 10,bottom: 10),
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                selectedType="complete";
                              });

                            },
                            child: Text(
                            'Completed/Expired',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: selectedType=="complete"?Colors.blue:black,
                                fontSize: 15.sp,
                                fontFamily: 'nunit_regular'),

                          )),
                        ),
                      ),


                    ],

                  ),


              ),
              Row(
                children: [

                  Expanded(flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 15.h, left: 5.h,right: 5.h,bottom: 15),
                    padding:  EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: black, width: 1),
                    ),
                    child: Text(
                      '03/19/2022',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: black,
                          fontSize: 14.sp,
                          fontFamily: 'nunit_regular'),
                    ),

                  ),),
                  Expanded(flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(top: 15.h, left: 5.h,right: 5.h,bottom: 15),
                      padding:  EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: black, width: 1),
                      ),
                      child: Text(
                        '04/19/2022',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: black,
                            fontSize: 14.sp,
                            fontFamily: 'nunit_regular'),
                      ),

                    ),),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(right: 5,left: 5),
                            height: 40,
                            width: 40,
                            child: CircleAvatar(
                              backgroundColor: app_text_color,
                             child: Text(
                               'GO',
                               textAlign: TextAlign.center,
                               style: TextStyle(
                                   color: white,
                                   fontSize: 14.sp,
                                   fontFamily: 'nunit_extrabold'),
                             ),

                            ),
                          ),),
                        Expanded(flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(left: 5,right: 5),
                            height: 40,
                            width: 40,
                            child: Image.asset(
                              'assets/reset.png',
                              fit: BoxFit.fill,
                            ),

                          ),),
                      ],
                    ),
                  )
                ],
              ),


              selectedType=="accepted"?
              Column(children: List.generate(5, (index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15,top: 15,right: 15,),
                  child: Container(
                    color: Colors.white,
                    child: Column(children: [
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          SizedBox(width: 5,),
                          Container(
                            margin: EdgeInsets.only(left: 5,right: 15),
                            height: 35,
                            width: 35,
                            child: Icon(Icons.cases_outlined),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Text(
                                  'Community Hospital',
                                  textAlign: TextAlign.start,
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
                      Row(
                        children: [
                          SizedBox(width: 5,),
                          Container(
                            margin: EdgeInsets.only(left: 5,right: 15),
                            height: 35,
                            width: 35,
                            child: Icon(Icons.location_on,color: Colors.grey,),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Text(
                                  '93 agrons paris \nnew york,NY 123',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.grey.withOpacity(.5),
                                      fontSize: 14.sp,
                                      fontFamily: 'nunit_regular'),

                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 5,),
                          Container(
                            margin: EdgeInsets.only(left: 5,right: 15),
                            height: 35,
                            width: 35,
                            child: Icon(Icons.calendar_month,color: Colors.grey,),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Text(
                                  'Aug 10 2021',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 14.sp,
                                      fontFamily: 'nunit_extrabold'),

                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child:   Column(
                            children: [

                              Row(
                                children: [
                                  SizedBox(width: 5,),
                                  Container(
                                    margin: EdgeInsets.only(left: 5,right: 15),
                                    height: 35,
                                    width: 35,
                                    child: Icon(Icons.lock_clock,color: Colors.grey,),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Text(
                                          '9:30 Am - 10:30 Am',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.grey.withOpacity(.5),
                                              fontSize: 14.sp,
                                              fontFamily: 'nunit_regular'),

                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 5,),
                                  Container(
                                    margin: EdgeInsets.only(left: 5,right: 15),
                                    height: 35,
                                    width: 35,
                                    child: Icon(Icons.phone,color: Colors.grey,),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Text(
                                          'Your bid Value',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14.sp,
                                              fontFamily: 'nunit_regular'),

                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),flex: 1,),
                          Expanded(child:  Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OnGoinShifts()));
                              },
                              child: Container(
                              height: 45,
                              width: 130,
                              decoration: BoxDecoration(
                                color: gradient_color_light,
                                borderRadius: BorderRadius.circular(
                                    20),

                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0.0, right: 0),
                                  child: Text(
                                    'Not Started',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontFamily: 'nunit_bold',
                                    ),
                                  ),
                                ),
                              ),
                            )),
                          ) ,flex: 0,)

                          ,
                        ],
                      ),
                      SizedBox(height: 10,),
                    ],),
                  ),
                );
              })):
              selectedType=="reject"?
              Column(children: List.generate(5, (index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15,top: 15,right: 15,),
                  child: Container(
                    color: Colors.white,
                    child: Column(children: [
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          SizedBox(width: 5,),
                          Container(
                            margin: EdgeInsets.only(left: 5,right: 15),
                            height: 35,
                            width: 35,
                            child: Icon(Icons.cases_outlined),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Text(
                                  'Community Hospital',
                                  textAlign: TextAlign.start,
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
                      Row(
                        children: [
                          SizedBox(width: 5,),
                          Container(
                            margin: EdgeInsets.only(left: 5,right: 15),
                            height: 35,
                            width: 35,
                            child: Icon(Icons.location_on,color: Colors.grey,),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Text(
                                  '93 agrons paris \nnew york,NY 123',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.grey.withOpacity(.5),
                                      fontSize: 14.sp,
                                      fontFamily: 'nunit_regular'),

                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 5,),
                          Container(
                            margin: EdgeInsets.only(left: 5,right: 15),
                            height: 35,
                            width: 35,
                            child: Icon(Icons.calendar_month,color: Colors.grey,),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Text(
                                  'Aug 10 2021',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 14.sp,
                                      fontFamily: 'nunit_extrabold'),

                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child:   Column(
                            children: [

                              Row(
                                children: [
                                  SizedBox(width: 5,),
                                  Container(
                                    margin: EdgeInsets.only(left: 5,right: 15),
                                    height: 35,
                                    width: 35,
                                    child: Icon(Icons.lock_clock,color: Colors.grey,),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Text(
                                          '9:30 Am - 10:30 Am',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.grey.withOpacity(.5),
                                              fontSize: 14.sp,
                                              fontFamily: 'nunit_regular'),

                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 5,),
                                  Container(
                                    margin: EdgeInsets.only(left: 5,right: 15),
                                    height: 35,
                                    width: 35,
                                    child: Icon(Icons.phone,color: Colors.grey,),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Text(
                                          'Your bid Value',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14.sp,
                                              fontFamily: 'nunit_regular'),

                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),flex: 1,),
                          Expanded(child:  Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              height: 45,
                              width: 130,
                              decoration: BoxDecoration(
                                color: gradient_color_light,
                                borderRadius: BorderRadius.circular(
                                    20),

                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0.0, right: 0),
                                  child: Text(
                                    'Rejected',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontFamily: 'nunit_bold',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ) ,flex: 0,)

                          ,
                        ],
                      ),
                      SizedBox(height: 10,),
                    ],),
                  ),
                );
              })):
              Column(children: List.generate(5, (index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15,top: 15,right: 15,),
                  child: Container(
                    color: Colors.white,
                    child: Column(children: [
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          SizedBox(width: 5,),
                          Container(
                            margin: EdgeInsets.only(left: 5,right: 15),
                            height: 35,
                            width: 35,
                            child: Icon(Icons.cases_outlined),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Text(
                                  'Community Hospital',
                                  textAlign: TextAlign.start,
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
                      Row(
                        children: [
                          SizedBox(width: 5,),
                          Container(
                            margin: EdgeInsets.only(left: 5,right: 15),
                            height: 35,
                            width: 35,
                            child: Icon(Icons.location_on,color: Colors.grey,),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Text(
                                  '93 agrons paris \nnew york,NY 123',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.grey.withOpacity(.5),
                                      fontSize: 14.sp,
                                      fontFamily: 'nunit_regular'),

                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 5,),
                          Container(
                            margin: EdgeInsets.only(left: 5,right: 15),
                            height: 35,
                            width: 35,
                            child: Icon(Icons.calendar_month,color: Colors.grey,),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Text(
                                  'Aug 10 2021',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 14.sp,
                                      fontFamily: 'nunit_extrabold'),

                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child:   Column(
                            children: [

                              Row(
                                children: [
                                  SizedBox(width: 5,),
                                  Container(
                                    margin: EdgeInsets.only(left: 5,right: 15),
                                    height: 35,
                                    width: 35,
                                    child: Icon(Icons.lock_clock,color: Colors.grey,),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Text(
                                          '9:30 Am - 10:30 Am',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.grey.withOpacity(.5),
                                              fontSize: 14.sp,
                                              fontFamily: 'nunit_regular'),

                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 5,),
                                  Container(
                                    margin: EdgeInsets.only(left: 0,right: 15),
                                    height: 35,
                                    width: 35,
                                    child: Icon(Icons.phone,color: Colors.grey,),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Text(
                                          'Your Earning: \$200\nPayment Status: Paid',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14.sp,
                                              fontFamily: 'nunit_regular'),

                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),flex: 1,),
                          Expanded(child:  Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child:InkWell(
                              onTap:(){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CompletedShiftDetail()));
                },
                              child: Container(
                              height: 45,
                              width: 130,
                              decoration: BoxDecoration(
                                color: gradient_color_light,
                                borderRadius: BorderRadius.circular(
                                    20),

                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0.0, right: 0),
                                  child: Text(
                                    'Completed',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontFamily: 'nunit_bold',
                                    ),
                                  ),
                                )),
                              ),
                            ),
                          ) ,flex: 0,)

                          ,
                        ],
                      ),
                      SizedBox(height: 10,),
                    ],),
                  ),
                );
              })),

          SizedBox(
          height: 30.h,
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
