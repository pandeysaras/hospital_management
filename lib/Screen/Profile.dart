
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medteam/Components/CommonButton.dart';
import 'package:medteam/Components/CommonButtonWhite.dart';
import 'package:medteam/Components/CommonTextField.dart';
import 'package:medteam/Utils/colors.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late double screenWidth, screenHeight;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  late TextEditingController mobile_controller;
  late FocusNode mobile_focusnode;
  String gender = "male";


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    ScreenUtil.init(context, designSize: Size(screenWidth, screenHeight));

    return Container(
      color: white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [

                Container(
                  decoration: new BoxDecoration(
                      gradient: LinearGradient(colors: [Color(0xFF3BA9E2),Color(0xFF0075B2)]),
                  ),
                  height: 150,
                  width: screenWidth,
                ),
                Center(
                  child: ClipRect(
                    child: Container(
                      margin: EdgeInsets.only(top:75),
                      height: 150,
                      width: 150,
                      child: Image.asset(
                        'assets/user.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5,),
            Text(
              'Morris',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: app_text_color,
                  fontSize: 17.sp,
                  fontFamily: 'nunit_extrabold'),
            ),
            SizedBox(height: 10,),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top:10),
                          height: 20,
                          width: 75,
                          child: Image.asset(
                            'assets/star.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(
                          '(NA Reviews)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: black,
                              fontSize: 14.sp,
                              fontFamily: 'nunit_regular'),
                        ),
                      ],
                    ),

                    Container(
                        height: 40,
                        child: VerticalDivider(
                          color: black,
                          thickness: 1,
                        ),

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 10,),
                            Text(
                              'NA',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 14.sp,
                                  fontFamily: 'nunit_bold'),
                            ),
                            Text(
                              'Green Flags',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: black,
                                  fontSize: 14.sp,
                                  fontFamily: 'nunit_regular'),
                            ),
                          ],
                        ),



                      ],
                    ),

                  ],
                ),

              ],
            ),
            SizedBox(height: 10,),
            Text(
              'RELIABILITY STATUS',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: black,
                  fontSize: 15.sp,
                fontFamily: 'nunit_extrabold'),
            ),
            SizedBox(height: 10,),
            Text(
                'Bid and work your first shift to see reliability stats.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: black,
                    fontSize: 13.sp,
                    fontFamily: 'nunit_bold'),
              ),
            SizedBox(height: 10),
            Text(
              'LIFETIME ACHIVEMENTS',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: black,
                  fontSize: 15.sp,
                  fontFamily: 'nunit_extrabold'),
            ),
            SizedBox(height: 10,),
            Container(
              decoration: new BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xFF3BA9E2),Color(0xFF0075B2)]),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'NA',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: white,
                                fontSize: 15.sp,
                                fontFamily: 'nunit_bold'),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Hours Paid',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: white,
                                fontSize: 15.sp,
                                fontFamily: 'nunit_regular'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 45,
                    child: VerticalDivider(
                      color: white,
                      thickness: 1,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'NA',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: white,
                                fontSize: 15.sp,
                                fontFamily: 'nunit_bold'),

                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Shifts Worked',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: white,
                                fontSize: 15.sp,
                                fontFamily: 'nunit_regular'),

                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 45,
                    child: VerticalDivider(
                      color: white,
                      thickness: 1,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'NA',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: white,
                                fontSize: 15.sp,
                                fontFamily: 'nunit_bold'),

                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Money Earned',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: white,
                                fontSize: 15.sp,
                                fontFamily: 'nunit_regular'),

                          ),
                        ),
                      ],
                    ),
                  ),


                ],

              ),


            ),

            SizedBox(height: 10,),
            Container(
              decoration: new BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1.0,
                    ),
                  ],
                color: white
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding:EdgeInsets.only(top:10,right: 20,left: 20,bottom: 10),
                    child: Text(
                      'Account Info',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: black,
                          fontSize: 15.sp,
                          fontFamily: 'nunit_bold'),
                    ),
                  ),
                  Divider(
                    color: color_box_three,
                    thickness: 3,
                    height: 3,
                  )
                ],
              ),
            ),

            SizedBox(height: 10,),
            Container(
              decoration: new BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1.0,
                    ),
                  ],
                  color: white
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding:EdgeInsets.only(top:10,right: 20,left: 20,bottom: 10),
                    child: Text(
                      'Resume',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: black,
                          fontSize: 15.sp,
                          fontFamily: 'nunit_bold'),
                    ),
                  ),
                  Divider(
                    color: color_box_three,
                    thickness: 3,
                    height: 3,
                  )
                ],
              ),
            ),

            SizedBox(height: 10,),
            Container(
              decoration: new BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1.0,
                    ),
                  ],
                  color: white
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding:EdgeInsets.only(top:10,right: 20,left: 20,bottom: 10),
                    child: Text(
                      'License',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: black,
                          fontSize: 15.sp,
                          fontFamily: 'nunit_bold'),
                    ),
                  ),
                  Divider(
                    color: color_box_three,
                    thickness: 3,
                    height: 3,
                  )
                ],
              ),
            ),

            SizedBox(height: 10,),
            Container(
              decoration: new BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1.0,
                    ),
                  ],
                  color: white
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding:EdgeInsets.only(top:10,right: 20,left: 20,bottom: 10),
                    child: Text(
                      'Documents',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: black,
                          fontSize: 15.sp,
                          fontFamily: 'nunit_bold'),
                    ),
                  ),
                  Divider(
                    color: color_box_three,
                    thickness: 3,
                    height: 3,
                  )
                ],
              ),
            ),

            SizedBox(height: 15,),
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
