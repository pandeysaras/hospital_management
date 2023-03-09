import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medteam/Components/CommonButton.dart';
import 'package:medteam/Components/CommonButtonWhite.dart';
import 'package:medteam/Components/CommonTextField.dart';
import 'package:medteam/Screen/Referal.dart';
import 'package:medteam/Screen/skill_set_sub_cat_screen.dart';
import 'package:medteam/Utils/colors.dart';
import 'package:medteam/view_model/sign_up_view_models/select_skillset_subcat_view_model.dart';
import 'package:medteam/view_model/spec_and_subspec_view_model.dart';
import 'package:provider/provider.dart';

import '../data/response/status.dart';

class DescribeYou extends StatefulWidget {
  @override
  _DescribeYouState createState() => _DescribeYouState();
}

class _DescribeYouState extends State<DescribeYou> {
  late double screenWidth, screenHeight;

  SpecAndSubSpecViewModel specAndSubSpecViewModel = SpecAndSubSpecViewModel();
  SelectSkillSetSubcatViewModel selectSkillSetSubcatViewModel = SelectSkillSetSubcatViewModel();

  int _selectedIndex = -1;
  void _onSelected (int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    specAndSubSpecViewModel.fetchSpecialityDataApi(context);
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

                SizedBox(height: 20.h,),
                Container(
                  child: Image.asset(
                    'assets/describe.png',
                    width: 236.h,
                    height: 180.h,
                    fit: BoxFit.contain,
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
                          margin:
                          EdgeInsets.only(top: 40.h, left: 40.h),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Please select the category of your skillset',
                              style: TextStyle(
                                  color: black,
                                  fontSize: 18.sp,
                                  fontFamily: 'nunit_bold'),
                            ),
                          ),
                        ),
                    //////////////////////////////////
                        ChangeNotifierProvider<SpecAndSubSpecViewModel>(
                          create: (BuildContext context) => specAndSubSpecViewModel,
                          child: Consumer<SpecAndSubSpecViewModel>(builder: (context, value, _) {
                            switch (value.specialityData.status) {
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
                                  child:  value.specialityData.data!.data!.isEmpty ?
                                  Center(
                                    child: Text("Sorry For Inconvenience!"),
                                  ) :ListView.builder(
                                      itemCount: value.specialityData.data!.data!.length,
                                      itemBuilder: (context, index) {
                                        return selectSkillSetCard(() {
                                          _onSelected(index);
                                          print(index);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SkillSetSubCatScreen()));
                                        }, value.specialityData.data!.data![index].name.toString());
                                      }),
                                );
                              default:
                                return Container();
                            }
                          }),
                        )  ,

                        SizedBox(height: 25.h),

                        Container(
                          margin: EdgeInsets.only(left: 40.h,right: 40.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonButtonWhite(
                                  label: 'PREV',
                                  onPressed: () async {},
                                  border: 35.h,
                                  height: 50.h,
                                  fontSize: 18,
                                  textColor: black,
                                  backgroundColor: black),
                              CommonButton(
                                  label: 'NEXT',
                                  onPressed: () async {
                                    Map data = {
                                      "speciality_id": _selectedIndex,
                                      "user_id":224
                                    };
                                    selectSkillSetSubcatViewModel.postSelectSkillSetApi(data, context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SkillSetSubCatScreen()));
                                  },
                                  border: 35.h,
                                  height: 50.h,
                                  fontSize: 18,
                                  textColor: white,
                                  backgroundColor: black),
                            ],
                          ),
                        ),
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

Widget selectSkillSetCard (VoidCallback onPress, String text) {
  return  Column(
    children: [
      InkWell(
        onTap: onPress,
        child: Align(
          alignment:Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.only(
                left: 40.h, top: 5.h),
            padding: EdgeInsets.only(left:0.h,right:0.h,top: 3.h,bottom: 3.h),
            child:  Text(
              text,
              style: TextStyle(
                color: black,
                fontSize: 18.sp,
                fontFamily:
                'nunit_regular',
              ),
            ),

          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(
            left: 40.h, right: 40.h),
        child: Divider(
            height: 1.h,
            color: gray
        ),
      )
    ],
  );
}