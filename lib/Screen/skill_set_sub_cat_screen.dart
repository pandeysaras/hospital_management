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

class SkillSetSubCatScreen extends StatefulWidget {
  @override
  _SkillSetSubCatScreenState createState() => _SkillSetSubCatScreenState();
}

class _SkillSetSubCatScreenState extends State<SkillSetSubCatScreen> {
  late double screenWidth, screenHeight;

  SpecAndSubSpecViewModel specAndSubSpecViewModel = SpecAndSubSpecViewModel();
  SelectSkillSetSubcatViewModel selectSkillSetSubcatViewModel = SelectSkillSetSubcatViewModel();

  List<int> _selectedIndices = [];
  List<String> _sendIndex = [];

  @override
  void initState() {
    specAndSubSpecViewModel.fetchSubSpecialityDataApi(context);
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
                              'Please select the sub category of \nyour skillset',
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
                            switch (value.subSpecialityData.status) {
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
                                  height: 250,
                                  child:  value.subSpecialityData.data!.data!.isEmpty ?
                                  Center(
                                    child: Text("Sorry For Inconvenience!"),
                                  ) :ListView.builder(
                                      itemCount: value.subSpecialityData.data!.data!.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (_selectedIndices.contains(index)) {
                                                _selectedIndices.remove(index);
                                                _sendIndex.remove(value.subSpecialityData.data!.data![index].id.toString());

                                              } else {
                                                _selectedIndices.add(index);
                                                _sendIndex.add(value.subSpecialityData.data!.data![index].id.toString());
                                              }
                                              print(_selectedIndices);
                                              print(_sendIndex.toString());
                                            });
                                          },
                                          child: Align(
                                            alignment:Alignment.topLeft,
                                            child: Container(
                                              width: screenWidth,
                                              color:  _selectedIndices.contains(index)  ? app_text_color : Colors.white,
                                              margin: EdgeInsets.only(
                                                  left: 40.h, top: 5.h, right: 35.h),
                                              padding: EdgeInsets.only(left:10.h,right:0.h,top: 3.h,bottom: 3.h),
                                              child:  Text(
                                                  value.subSpecialityData.data!.data![index].name.toString(),
                                                style: TextStyle(
                                                  color: _selectedIndices.contains(index) ? Colors.white : Colors.black,
                                                  fontSize: 18.sp,
                                                  fontFamily:
                                                  'nunit_regular',
                                                ),
                                              ),

                                            ),
                                          ),
                                        );

                                        //   selectSkillSetCard(() {
                                        //   _onSelected(index);
                                        //   print(index);
                                        //   // Navigator.push(
                                        //   //     context,
                                        //   //     MaterialPageRoute(
                                        //   //         builder: (context) =>
                                        //   //             SkillSetSubCatScreen()));
                                        // }, value.subSpecialityData.data!.data![index].name.toString());
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
                                  onPressed: (
                                      )  {
                                    Navigator.pop(context);
                                  },
                                  border: 35.h,
                                  height: 50.h,
                                  fontSize: 18,
                                  textColor: black,
                                  backgroundColor: black),
                              CommonButton(
                                  label: 'NEXT',
                                  onPressed: () async {
                                    Map data = {
                                      "subspeciality_id": _sendIndex.toString(),
                                      "user_id":224
                                    };
                                   await  selectSkillSetSubcatViewModel.postSelectSubCatSkillSetApi(data, context);

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Referal()));
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