import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medteam/Components/CommonButton.dart';
import 'package:medteam/Components/CommonButtonWhite.dart';
import 'package:medteam/Components/CommonButtonWithPadding.dart';
import 'package:medteam/Components/CommonTextField.dart';
import 'package:medteam/Screen/BottomMenuBar.dart';
import 'package:medteam/Screen/PaymentMethod.dart';
import 'package:medteam/Utils/colors.dart';
import 'package:medteam/view_model/shift_data_view_model.dart';
import 'package:provider/provider.dart';

import '../data/response/status.dart';
import 'FindWorkDetail.dart';

class FindWorkList extends StatefulWidget {
  @override
  _FindWorkListState createState() => _FindWorkListState();
}

class _FindWorkListState extends State<FindWorkList> {
  late double screenWidth, screenHeight;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  late TextEditingController mobile_controller, license_no_controller;
  late FocusNode mobile_focusnode, license_no_focusnode;
  String gender = "male";
  ShiftDataViewModel shiftDataViewModel = ShiftDataViewModel();

  @override
  void initState() {
    shiftDataViewModel.fetchShiftDataApi(context);
    mobile_controller = TextEditingController();
    license_no_controller = TextEditingController();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    ScreenUtil.init(context, designSize: Size(screenWidth, screenHeight));

    return Scaffold(
      key: _key,
      backgroundColor:   color_box_bg,
      appBar: AppBar(
        title: Text(
          'Find Work',
          style: TextStyle(color: white, fontFamily: 'nunit_bold'),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          color: color_box_bg,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 15.0),
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //         child: Container(
                      //           height: 50,
                      //           decoration: BoxDecoration(
                      //             color: color_box_two,
                      //             borderRadius: BorderRadius.circular(20),
                      //
                      //           ),
                      //           child: Center(
                      //             child: Padding(
                      //               padding: const EdgeInsets.only(
                      //                   left: 12.0, right: 12),
                      //               child: Text(
                      //                 ' Select Shift ',
                      //                 style: TextStyle(
                      //                   color: black,
                      //                   fontSize: 12.sp,
                      //                   fontFamily: 'nunit_bold',
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //         flex: 0,
                      //       ),
                      //       Expanded(
                      //         child: Padding(
                      //           padding: const EdgeInsets.only(
                      //               left: 25, right: 25),
                      //           child: Container(
                      //             decoration: BoxDecoration(
                      //               color: color_box_two,
                      //               borderRadius: BorderRadius.circular(20),
                      //
                      //             ),
                      //             child: Padding(
                      //               padding: const EdgeInsets.only(
                      //                   left: 10.0, right: 10),
                      //               child: Row(
                      //                 children: [
                      //                   Expanded(
                      //                     child: Container(
                      //                       child: Padding(
                      //                         padding: const EdgeInsets.only(
                      //                             bottom: 0.0),
                      //                         child: TextField(
                      //
                      //                             maxLines: 1,
                      //                             autofocus: false,
                      //                             enabled: true,
                      //                             cursorColor: black,
                      //                             style: TextStyle(
                      //                               fontSize: 18.sp,
                      //                               color: black,
                      //                               fontFamily: "nunit_regular",
                      //                             ),
                      //                             onEditingComplete: () {
                      //                               // focusChange();
                      //                             },
                      //                             decoration: InputDecoration(
                      //                               focusedBorder: border,
                      //                               border: border,
                      //                               enabledBorder: border,
                      //                               disabledBorder: border,
                      //                               contentPadding: EdgeInsets
                      //                                   .symmetric(
                      //                                   vertical: 0.0,
                      //                                   horizontal: 0.0),
                      //                               hintText: "Zip Code",
                      //                               hintStyle: TextStyle(
                      //                                 fontSize: 14.sp,
                      //                                 color: gray,
                      //                                 fontFamily: "nunit_regular",
                      //                               ),
                      //
                      //
                      //                             )),
                      //                       ),
                      //
                      //                     ),
                      //                   ),
                      //                   Container(
                      //                     height: 45,
                      //                     decoration: BoxDecoration(
                      //                       color: gradient_color_dark,
                      //                       borderRadius: BorderRadius.circular(
                      //                           20),
                      //                       border: Border.all(
                      //                           color: gradient_color_dark,
                      //                           width: 1),
                      //                     ),
                      //                     child: Center(
                      //                       child: Padding(
                      //                         padding: const EdgeInsets.only(
                      //                             left: 20.0, right: 20),
                      //                         child: Text(
                      //                           ' Find ',
                      //                           style: TextStyle(
                      //                             color: black,
                      //                             fontSize: 12.sp,
                      //                             fontFamily: 'nunit_bold',
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //         flex: 1,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(height: 8),
                      ////////////////
                     // /
                      ChangeNotifierProvider<ShiftDataViewModel>(
                        create: (BuildContext context) => shiftDataViewModel,
                        child: Consumer<ShiftDataViewModel>(builder: (context, value, _) {
                          switch (value.shiftData.status) {
                            case Status.loading:
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            case Status.error:
                              return Center(
                                child: Text(
                                  value.shiftData.message.toString()
                                   // "Sorry For Inconvenience!"
                                ),
                              );
                            case Status.completed:
                              return SizedBox(
                                width: double.infinity,
                                height: screenHeight*0.7,
                                child:  value.shiftData.data!.data!.isEmpty ?
                                Center(
                                  child: Text("Sorry For Inconvenience ok!"),
                                ) :ListView.builder(
                                    itemCount: value.shiftData.data!.data!.length,
                                    itemBuilder: (context, index) {
                                      return workDetailCard(context, value.shiftData.data!.data![index].title.toString(), value.shiftData.data!.data![index].users!.addressLine1.toString(), value.shiftData.data!.data![index].users!.addressLine2.toString(), value.shiftData.data!.data![index].startDate.toString(), value.shiftData.data!.data![index].startTime.toString(), value.shiftData.data!.data![index].endTime.toString(), value.shiftData.data!.data![index].users!.phone.toString());


                                      //
                                      //   SelectIndustryCard(text: value.industryData.data!.data![index].name.toString(), func: (){
                                      //   _onSelected(index);
                                      //   print(index);
                                      //
                                      // },);
                                    }),
                              );
                            default:
                              return Container();
                          }
                        }),
                      )  ,

                      SizedBox(
                        height: 30.h,
                      ),
                      Container(
                        height: 45,
                        width: 200,
                        decoration: BoxDecoration(
                          color: color_box_two,
                          borderRadius: BorderRadius.circular(
                              20),

                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 0.0, right: 0),
                            child: Text(
                              'Sort By',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                                fontFamily: 'nunit_bold',
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
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

Widget workDetailCard (BuildContext context, String name, String address1, String address2, String date, String startTime, String endTime, String phone) {
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
                    name,
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
                    '$address1 \n$address2',
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
                    date,
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
                            '$startTime - $endTime',
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
                            phone,
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
              ],
            ),flex: 1,),
            Expanded(child:  Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: InkWell(
                  onTap:(){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FindWorkDetail()));
                  },
                  child:Container(
                    height: 45,
                    width: 155,
                    decoration: BoxDecoration(
                      color: gradient_color_dark,
                      borderRadius: BorderRadius.circular(
                          10),
                      border: Border.all(
                          color: gradient_color_dark,
                          width: 1),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 0.0, right: 0),
                        child: Text(
                          'Conform The Shift',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.sp,
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
}
