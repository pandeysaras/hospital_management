
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medteam/Components/CommonButton.dart';
import 'package:medteam/Components/CommonButtonWhite.dart';
import 'package:medteam/Components/CommonTextField.dart';
import 'package:medteam/Utils/colors.dart';

class TimeTrack extends StatefulWidget {
  @override
  _TimeTrackState createState() => _TimeTrackState();
}

class _TimeTrackState extends State<TimeTrack> {
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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 170,
              child:Image.asset(
                'assets/time_clock.png',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              'Important!',
              style: TextStyle(
                  color: black,
                  fontSize: 18.sp,
                  fontFamily: 'nunit_bold'),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(left: 15,right: 15),
              child: Text(
                'This is your time clock to record your hours to get paid. The time clock will appear when it is time to start your shift. Please remember to always come to the time clock to clock-in and clock-out so you get paid on time!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: black,
                    fontSize: 15.sp,
                    fontFamily: 'nunit_regular'),

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
