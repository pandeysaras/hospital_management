import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medteam/Screen/DashBoard.dart';
import 'package:medteam/Screen/TimeTrack.dart';
import 'package:medteam/Screen/Profile.dart';
import 'package:medteam/Screen/Schedule.dart';
import 'package:medteam/Utils/colors.dart';

class BottomMenuBar extends StatefulWidget {
  int current_index = 0;

  BottomMenuBar({required this.current_index});

  @override
  _BottomMenuBarState createState() => _BottomMenuBarState();
}

class _BottomMenuBarState extends State<BottomMenuBar> {
  late double screenWidth, screenHeight;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key


  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    ScreenUtil.init(context, designSize: Size(screenWidth, screenHeight));


    List<Widget> _children = [
      DashBoard(),
      TimeTrack(),
      Schedule(),
      Profile(),

    ];


    return Scaffold(
      key: _key,
      backgroundColor: white,
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
      body:_children[widget.current_index],
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top:3,bottom: 3,left: 3,right: 3),
        decoration: BoxDecoration(
          color: color_box_two,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),

        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.current_index == 0 ? Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(top:5,bottom: 5),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      widget.current_index =0;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,

                    children: [
                  SizedBox(
                  height: 30.h,
                  child: Container(
                    color: Colors.transparent,
                    child:Image.asset(
                      'assets/dashboard_bottom.png',
                      fit: BoxFit.fill,
                    ),
                  )),
                      Text(
                        'Dash Board',
                        style: TextStyle(
                            color: black,
                            fontSize: 12.sp,
                            fontFamily: 'nunit_bold'),

                      ),
                    ],
                  ),
                ),
              ),
            ):
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  setState(() {
                    widget.current_index =0;
                  });

                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    SizedBox(
                        height: 30.h,
                        child: Container(
                          color: Colors.transparent,
                          child:Image.asset(
                            'assets/dashboard_bottom.png',
                            fit: BoxFit.fill,
                          ),
                        )),
                    Text(
                      'Dash Board',
                      style: TextStyle(
                          color: white,
                          fontSize: 12.sp,
                          fontFamily: 'nunit_bold'),

                    ),
                  ],
                ),
              ),
            ),

            widget.current_index == 1 ? Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(top:5,bottom: 5),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: InkWell(
                  onTap: () {

                    setState(() {
                      widget.current_index =1;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      SizedBox(
                          height: 30.h,
                          child: Container(
                            color: Colors.transparent,
                            child:Image.asset(
                              'assets/time_black.png',
                              fit: BoxFit.fill,
                            ),
                          )),
                      Text(
                        'Time Track',
                        style: TextStyle(
                            color: black,
                            fontSize: 12.sp,
                            fontFamily: 'nunit_bold'),

                      ),
                    ],
                  ),
                ),
              ),
            ):
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  setState(() {
                    widget.current_index =1;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    SizedBox(
                        height: 30.h,
                        child: Container(
                          color: Colors.transparent,
                          child:Image.asset(
                            'assets/time_white.png',
                            fit: BoxFit.fill,
                          ),
                        )),
                    Text(
                      'Time Track',
                      style: TextStyle(
                          color: white,
                          fontSize: 12.sp,
                          fontFamily: 'nunit_bold'),

                    ),
                  ],
                ),
              ),
            ),

            widget.current_index == 2 ? Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(top:5,bottom: 5),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      widget.current_index =2;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      SizedBox(
                          height: 30.h,
                          child: Container(
                            color: Colors.transparent,
                            child:Image.asset(
                              'assets/schedule_black.png',
                              fit: BoxFit.fill,
                            ),
                          )),
                      Text(
                        'Schedule',
                        style: TextStyle(
                            color: black,
                            fontSize: 12.sp,
                            fontFamily: 'nunit_bold'),

                      ),
                    ],
                  ),
                ),
              ),
            ):
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  setState(() {
                    widget.current_index =2;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    SizedBox(
                        height: 30.h,
                        child: Container(
                          color: Colors.transparent,
                          child:Image.asset(
                            'assets/schedule_white.png',
                            fit: BoxFit.fill,
                          ),
                        )),
                    Text(
                      'Schedule',
                      style: TextStyle(
                          color: white,
                          fontSize: 12.sp,
                          fontFamily: 'nunit_bold'),

                    ),
                  ],
                ),
              ),
            ),

            widget.current_index == 3 ? Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(top:5,bottom: 5),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: InkWell(
                  onTap: (){
                    setState(() {
                      widget.current_index =3;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      SizedBox(
                          height: 30.h,
                          child: Container(
                            color: Colors.transparent,
                            child:Image.asset(
                              'assets/profile_black.png',
                              fit: BoxFit.fill,
                            ),
                          )),
                      Text(
                        'Profile',
                        style: TextStyle(
                            color: black,
                            fontSize: 12.sp,
                            fontFamily: 'nunit_bold'),

                      ),
                    ],
                  ),
                ),
              ),
            ):
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  setState(() {
                    widget.current_index =3;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    SizedBox(
                        height: 30.h,
                        child: Container(
                          color: Colors.transparent,
                          child:Image.asset(
                            'assets/profile_white.png',
                            fit: BoxFit.fill,
                          ),
                        )),
                    Text(
                      'Profile',
                      style: TextStyle(
                          color: white,
                          fontSize: 12.sp,
                          fontFamily: 'nunit_bold'),

                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
        /*child: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          iconSize: 30.h,
          selectedFontSize: 10.sp,
          unselectedFontSize: 10.sp,
          selectedLabelStyle: TextStyle(
              color: black, fontSize: 10.sp, fontFamily: 'nunit_bold'),
          unselectedLabelStyle: TextStyle(
              color: white,
              fontSize: 10.sp,
              fontFamily: 'nunit_bold'),
          onTap: onTabTapped,
          //currentIndex: widget.current_index,
          selectedItemColor: black,
          unselectedItemColor: white,
          items: [
            BottomNavigationBarItem(
              icon: SizedBox(
                  height: 30.h,
                  child: ImageIcon(
                    AssetImage('assets/dashboard_bottom.png'),
                  )),
              label: 'Dash Board',
              activeIcon: Container(
                child: SizedBox(
                    height: 30.h,
                    child: ImageIcon(AssetImage('assets/dashboard_bottom.png'))),
              ),
            ),

            BottomNavigationBarItem(
              icon: SizedBox(
                  height: 30.h,
                  child: ImageIcon(
                    AssetImage('assets/dashboard_bottom.png'),
                  )),
              label: 'Dash Board',
              activeIcon: SizedBox(
                  height: 30.h,
                  child: ImageIcon(AssetImage('assets/dashboard_bottom.png'))),
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                  height: 30.h,
                  child: ImageIcon(
                    AssetImage('assets/dashboard_bottom.png'),
                  )),
              label: 'Dash Board',
              activeIcon: SizedBox(
                  height: 30.h,
                  child: ImageIcon(AssetImage('assets/dashboard_bottom.png'))),
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                  height: 30.h,
                  child: ImageIcon(
                    AssetImage('assets/dashboard_bottom.png'),
                  )),
              label: 'Dash Board',
              activeIcon: SizedBox(
                  height: 30.h,
                  child: ImageIcon(AssetImage('assets/dashboard_bottom.png'))),
            ),
          ],

        ),*/
      ),
    );
  }

  void onTabTapped(int index) async {
    print('ontapped');
      if (mounted) {
        setState(() {
          widget.current_index = index;
          // _pageController.jumpToPage(index);

        });
      }


  }
}