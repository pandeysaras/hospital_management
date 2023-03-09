
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medteam/Components/CommonButton.dart';
import 'package:medteam/Components/CommonButtonWhite.dart';
import 'package:medteam/Components/CommonTextField.dart';
import 'package:medteam/Screen/BidResults.dart';
import 'package:medteam/Screen/DashBoardEarning.dart';
import 'package:medteam/Utils/colors.dart';

import 'AppliedShifts.dart';
import 'FindWork.dart';
import 'FindWorkList.dart';
import 'UploadLicense.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
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
        child: Column(
          children: [
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 45,
                  width: 45,
                  child: Image.asset(
                    'assets/good_day.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  margin: EdgeInsets.only(right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi',
                        style: TextStyle(
                            color: black,
                            fontSize: 17.sp,
                            fontFamily: 'nunit_extrabold'),

                      ),
                      Text(
                        'Have a Good Day!',
                        style: TextStyle(
                            color: black,
                            fontSize: 17.sp,
                            fontFamily: 'nunit_bold'),

                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 30,),
           InkWell(
             onTap: (){
               Navigator.push(
                   context,
                   MaterialPageRoute(
                       builder: (context) => FindWorkList()));
             },
               child: Container(
              margin: EdgeInsets.only(right: 40,),
              padding: EdgeInsets.all(5),
              decoration: new BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1.0,),],
                  color: white,
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 45,
                    width: 45,
                    child: Image.asset(
                      'assets/find_work.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Find Work',
                          style: TextStyle(
                              color: black,
                              fontSize: 19.sp,
                              fontFamily: 'nunit_extrabold'),

                        ),
                        Text(
                          'Click to browse openings.',
                          style: TextStyle(
                              color: black,
                              fontSize: 13.sp,
                              fontFamily: 'nunit_bold'),

                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
            SizedBox(height: 20,),
            InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AppliedShifts()));
                },
                child: Container(
              margin: EdgeInsets.only(right: 40,),
              padding: EdgeInsets.all(5),
              decoration: new BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1.0,),],
                color: color_box_one,
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 45,
                    width: 45,
                    child: Image.asset(
                      'assets/bid.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bids Placed',
                          style: TextStyle(
                              color: black,
                              fontSize: 19.sp,
                              fontFamily: 'nunit_extrabold'),

                        ),
                        Text(
                          'Shifts requested waiting approval.',
                          style: TextStyle(
                              color: black,
                              fontSize: 13.sp,
                              fontFamily: 'nunit_bold'),

                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),

            SizedBox(height: 20,),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BidResults())
                );
              },
              child: Container(
                margin: EdgeInsets.only(right: 40,),
                padding: EdgeInsets.all(5),
                decoration: new BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1.0,),],
                  color: color_box_two,
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 45,
                      width: 45,
                      child: Image.asset(
                        'assets/bid_result.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bids Results',
                            style: TextStyle(
                                color: black,
                                fontSize: 19.sp,
                                fontFamily: 'nunit_extrabold'),

                          ),
                          Text(
                            'View Scheduled Shifts.',
                            style: TextStyle(
                                color: black,
                                fontSize: 13.sp,
                                fontFamily: 'nunit_bold'),

                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            SizedBox(height: 20,),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashBoardEarning()),
                );
              },
              child: Container(
                margin: EdgeInsets.only(right: 40,),
                padding: EdgeInsets.all(5),
                decoration: new BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1.0,),],
                  color: color_box_three,
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 45,
                      width: 45,
                      child: Image.asset(
                        'assets/earning.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Earnings',
                            style: TextStyle(
                                color: black,
                                fontSize: 19.sp,
                                fontFamily: 'nunit_extrabold'),

                          ),
                          Text(
                            'View Your Earnings.',
                            style: TextStyle(
                                color: black,
                                fontSize: 13.sp,
                                fontFamily: 'nunit_bold'),

                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  }

  final border = UnderlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide.none,
  );
}
