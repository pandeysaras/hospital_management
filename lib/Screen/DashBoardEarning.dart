

import 'package:flutter/material.dart';
import 'package:medteam/Screen/BottomMenuBar.dart';
import 'package:medteam/Utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashBoardEarning extends StatefulWidget {
  @override
  _DashBoardEarningState createState() => _DashBoardEarningState();
}

class _DashBoardEarningState extends State<DashBoardEarning> {
  late double screenWidth, screenHeight;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key


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
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text(
            'Dash Board',
            style: TextStyle(color: white, fontFamily: 'nunit_bold'),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
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
            SizedBox(height: 10),
           Container(
             padding: EdgeInsets.only(top: 10,bottom: 10),
             margin: EdgeInsets.only(top: 15,left: 20,right: 20),
             decoration: new BoxDecoration(

                 gradient: LinearGradient(colors: [Color(0xFF3BA9E2),Color(0xFF0075B2)]),
                 borderRadius: BorderRadius.circular(25)
             ),
             child: Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                 Row(
                   children: [
                     Expanded(
                       flex:1,
                       child: Text(
                         'Total Earnings',
                         textAlign: TextAlign.center,
                         style: TextStyle(
                             color: white,
                             fontSize: 15.sp,
                             fontFamily: 'nunit_regular'),
                       ),
                     ),
                     Expanded(
                       flex: 1,
                       child: Text(
                         'Remain Payout',
                         textAlign: TextAlign.center,
                         style: TextStyle(
                             color: white,
                             fontSize: 15.sp,
                             fontFamily: 'nunit_regular'),
                       ),
                     ),
                   ],
                 ),
                 Row(
                   children: [
                     Expanded(
                       flex:1,
                       child: Text(
                         '\$0',
                         textAlign: TextAlign.center,
                         style: TextStyle(
                             color: white,
                             fontSize: 20.sp,
                             fontFamily: 'nunit_extrabold'),
                       ),
                     ),
                     Expanded(
                       flex: 1,
                       child: Text(
                         '\$1',
                         textAlign: TextAlign.center,
                         style: TextStyle(
                             color: white,
                             fontSize: 20.sp,
                             fontFamily: 'nunit_extrabold'),
                       ),
                     ),
                   ],
                 ),
               ],
             ),
           ),
            SizedBox(height: 30),

            Container(
              width: screenWidth,
              padding: EdgeInsets.only(top: 30,bottom: 30),
              margin: EdgeInsets.only(top: 15,left: 20,right: 20),
              decoration: new BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xFF3BA9E2),Color(0xFF0075B2)]),
                  borderRadius: BorderRadius.circular(25)
              ),
              child: Column(
                children: [
                  Text(
                    'Total Earnings',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: white,
                        fontSize: 20.sp,
                        fontFamily: 'nunit_regular'),
                  ),
                  Text(
                    '\$0',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: white,
                        fontSize: 40.sp,
                        fontFamily: 'nunit_extrabold'),
                  ),

                ],
              ),
            )

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