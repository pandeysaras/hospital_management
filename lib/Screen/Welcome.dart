import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medteam/Components/CommonButtonWhite.dart';
import 'package:medteam/Utils/colors.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();

}

class _WelcomeState extends State<Welcome> {
  late double screenWidth, screenHeight;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    ScreenUtil.init(context,
        designSize: Size(screenWidth, screenHeight));
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 0.0,
      ),
      body: SafeArea(
        child: Container(
          color:gradient_color_light,
         /* decoration: new BoxDecoration(
            gradient: LinearGradient(colors: [ Color(0xFF3BA9E2),Color(0xFF0075B2)],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),),*/
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome to',
                        style: TextStyle(
                            color: white,
                            fontSize: 20.sp,
                            fontFamily: 'nunit_bold'),
                      ),
                      SizedBox(height: 15.h,),
                      Container(
                        margin:EdgeInsets.only(left: 25,right: 25),
                        child: Image.asset(
                          'assets/splash_icon.png',
                          width: screenWidth,
                          height: 150.h,
                        ),
                      ),
                      SizedBox(height: 30.h,),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        child: Text(
                          'An end to end shifts delivery digital platform',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: white,
                              fontSize: 18.sp,
                              fontFamily: 'nunit_regular'),
                        ),
                      ) ,SizedBox(height: 10.h,),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20),

                        child: Text(
                          'We are excited to have you join us.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: white,
                              fontSize: 18.sp,
                              fontFamily: 'nunit_regular'),
                        ),
                      ),Container(
                        margin: EdgeInsets.only(left: 20,right: 20),

                        child: Text(
                          'Explore the shifts near you now!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: white,
                              fontSize: 18.sp,
                              fontFamily: 'nunit_regular'),
                        ),
                      ),
                      SizedBox(height: 50.h,),
                      CommonButtonWhite(
                          label: 'GET STARTED',
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Welcome()));
                          },
                          border: 35.h,
                          height: 50.h,
                          fontSize: 18,
                          textColor: black,
                          backgroundColor: black),
                    ],
                  ),
                ),


              ],
            ),
          ),
        ),
      ),

    );
  }



}
