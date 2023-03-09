import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medteam/Screen/Login.dart';
import 'package:medteam/Utils/colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late double screenWidth, screenHeight;

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login())),
    );
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
        child: Container(
          //decoration: new BoxDecoration(
          /* gradient: LinearGradient(colors: [ Color(0xFF3BA9E2),Color(0xFF0075B2)],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  ),),*/
          color: gradient_color_light,
          child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: Image.asset(
                        'assets/splash_icon.png',
                        width: screenWidth,
                        height: 200.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
