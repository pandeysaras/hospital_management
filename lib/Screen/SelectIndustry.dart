import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medteam/Components/CommonButton.dart';
import 'package:medteam/Components/CommonTextField.dart';
import 'package:medteam/Screen/DescribeYou.dart';
import 'package:medteam/Utils/colors.dart';
import 'package:medteam/view_model/sign_up_view_models/industry_data_view_model.dart';
import 'package:provider/provider.dart';

import '../Constant.dart';
import '../data/response/status.dart';
import '../model/SucessModel.dart';

class SelectIndustry extends StatefulWidget {
  @override
  _SelectIndustryState createState() => _SelectIndustryState();
}

class _SelectIndustryState extends State<SelectIndustry> {
  late double screenWidth, screenHeight;
  IndustryDataViewModel industryDataViewModel = IndustryDataViewModel();

   int _selectedIndex = -1;
    String _sendIndex = "";

  @override
  void initState() {
    industryDataViewModel.fetchIndustryDataApi(context);
    super.initState();
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
            color: white,
            child: Column(
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Container(
                  margin: EdgeInsets.only(right: 50.w, left: 50.w),
                  child: Text(
                    'Lets get started!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: black,
                        fontSize: 30.sp,
                        fontFamily: 'nunit_bold'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 50.w, left: 50.w),
                  child: Text(
                    'Create an account with your name, phone & email to see shifts near you ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: gray,
                        fontSize: 17.sp,
                        fontFamily: 'nunit_regular'),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    margin: EdgeInsets.only(top: 40.h),
                    decoration: BoxDecoration(
                      color: round_color.withOpacity(0.10),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60.w),
                          topRight: Radius.circular(60.w)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 40.h, left: 40.h),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Please select industry & interest',
                              style: TextStyle(
                                  color: black,
                                  fontSize: 18.sp,
                                  fontFamily: 'nunit_bold'),
                            ),
                          ),
                        ),

                        ChangeNotifierProvider<IndustryDataViewModel>(
                          create: (BuildContext context) => industryDataViewModel,
                          child: Consumer<IndustryDataViewModel>(builder: (context, value, _) {
                            switch (value.industryData.status) {
                              case Status.loading:
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              case Status.error:
                                return Center(
                                  child: Text(
                                      "Sorry For Inconvenience!"
                                  ),
                                );
                              case Status.completed:
                                return SizedBox(
                                  width: double.infinity,
                                  height: 200,
                                  child:  value.industryData.data!.data!.isEmpty ?
                                  Center(
                                    child: Text("Sorry For Inconvenience!"),
                                  ) :ListView.builder(
                                      itemCount: value.industryData.data!.data!.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: (){
                                            setState(() {
                                               _selectedIndex = index;
                                               _sendIndex = value.industryData.data!.data![index].id.toString();
                                            print(_selectedIndex);
                                              print(_sendIndex);
                                            });
                                          },
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color:  index == _selectedIndex  ? app_text_color : Colors.white,
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(20))),
                                              margin: EdgeInsets.only(
                                                  left: 40.h, top: 10.h),
                                              padding: EdgeInsets.only(
                                                  left: 13.h,
                                                  right: 13.h,
                                                  top: 3.h,
                                                  bottom: 3.h),
                                              child: Text(
                                                value.industryData.data!.data![index].name.toString(),
                                                style: TextStyle(
                                                  color: index == _selectedIndex ? Colors.white : Colors.black,
                                                  fontSize: 18.sp,
                                                  fontFamily: 'nunit_bold',
                                                ),
                                              ),
                                            ),
                                          ),
                                        );


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

                        SizedBox(height: 25.h),
                        CommonButton(
                            label: 'NEXT',
                            onPressed: () async {
                              Map data = {
                                "industry": _sendIndex,
                                "user_id":224
                              };
                             await industryDataViewModel.postSelectIndustryApi(data, context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DescribeYou()));
                            },
                            border: 35,
                            height: 50,
                            fontSize: 18,
                            textColor: white,
                            backgroundColor: black),
                        SizedBox(height: 15.h),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text(
                        //       "Don't have account?",
                        //       style: TextStyle(
                        //           color: gray,
                        //           fontSize: 17.sp,
                        //           fontFamily: 'nunit_regular'),
                        //     ),
                        //     InkWell(
                        //       onTap: () {
                        //       },
                        //       child: Text(
                        //         " SIGN UP",
                        //         style: TextStyle(
                        //             color: app_text_color,
                        //             fontSize: 17.sp,
                        //             fontFamily: 'nunit_bold'),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(height: 30.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

/* ==================================================================== */


Widget selectIndustryCard (VoidCallback onPress, String text){
  return InkWell(
    onTap: onPress,
    child: Align(
      alignment: Alignment.topLeft,
      child: Container(
        decoration: BoxDecoration(
            color: app_text_color,
            borderRadius: BorderRadius.all(
                Radius.circular(20))),
        margin: EdgeInsets.only(
            left: 40.h, top: 10.h),
        padding: EdgeInsets.only(
            left: 13.h,
            right: 13.h,
            top: 3.h,
            bottom: 3.h),
        child: Text(
          text,
          style: TextStyle(
            color: white,
            fontSize: 18.sp,
            fontFamily: 'nunit_bold',
          ),
        ),
      ),
    ),
  );
}

class SelectIndustryCard extends StatefulWidget {
  //final VoidCallback onPress;
  final String text;
  final Function func;

  const SelectIndustryCard({Key? key, required this.text, required this.func}) : super(key: key);

  @override
  State<SelectIndustryCard> createState() => _SelectIndustryCardState();
}

class _SelectIndustryCardState extends State<SelectIndustryCard> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        _handleTap();
        widget.func;
      },
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          decoration: BoxDecoration(
              color: _active ? app_text_color : Colors.white,
              borderRadius: BorderRadius.all(
                  Radius.circular(20))),
          margin: EdgeInsets.only(
              left: 40.h, top: 10.h),
          padding: EdgeInsets.only(
              left: 13.h,
              right: 13.h,
              top: 3.h,
              bottom: 3.h),
          child: Text(
            widget.text,
            style: TextStyle(
              color: _active ? Colors.white : Colors.black,
              fontSize: 18.sp,
              fontFamily: 'nunit_bold',
            ),
          ),
        ),
      ),
    );
  }
}
