
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medteam/Screen/BidResults.dart';
import 'package:medteam/Screen/DashBoardEarning.dart';
import 'package:medteam/Utils/colors.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
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
            Text(
              'No data available',
              style: TextStyle(color: gray, fontFamily: 'nunit_bold'),
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