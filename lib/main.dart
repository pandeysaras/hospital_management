import 'package:flutter/material.dart';
import 'package:medteam/Screen/Profile.dart';
import 'package:medteam/Screen/ProfileInfo.dart';
import 'package:medteam/Screen/ProfilePhoto.dart';
import 'package:medteam/Screen/UploadLicense.dart';
import 'package:medteam/Screen/UploadedDocuments.dart';
import 'package:medteam/Screen/YourResume.dart';
import 'package:medteam/view_model/complete_profile_view_models/complete_profile_1_view_model.dart';
import 'package:medteam/view_model/complete_profile_view_models/complete_profile_2_view_model.dart';
import 'package:medteam/view_model/complete_profile_view_models/complete_profile_3_view_model.dart';
import 'package:medteam/view_model/sign_up_view_models/enter_name_view_model.dart';
import 'package:medteam/view_model/sign_up_view_models/hear_view_model.dart';
import 'package:medteam/view_model/sign_up_view_models/industry_data_view_model.dart';
import 'package:medteam/view_model/sign_up_view_models/login_view_model.dart';
import 'package:medteam/view_model/sign_up_view_models/moile_view_model.dart';
import 'package:medteam/view_model/sign_up_view_models/post_hear_view_model.dart';
import 'package:medteam/view_model/sign_up_view_models/profile_image_view_model.dart';
import 'package:medteam/view_model/sign_up_view_models/refral_view_model.dart';
import 'package:medteam/view_model/sign_up_view_models/profile_view_model.dart';
import 'package:medteam/view_model/spec_and_subspec_view_model.dart';
import 'package:provider/provider.dart';
import 'package:medteam/Screen/Splash.dart';
import 'package:medteam/view_model/sign_up_view_models/auth_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );
}

//--------------------

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => EnterNameViewModel()),
        ChangeNotifierProvider(create: (_) => EnterMobileNumberViewModel()),
        ChangeNotifierProvider(create: (_) => ProfilePicViewModel()),
        ChangeNotifierProvider(create: (_) => HearAboutUSViewModel()),
        ChangeNotifierProvider(create: (_) => PostHearAboutUSViewModel()),
        ChangeNotifierProvider(create: (_) => RefralViewMODEL()),
        ChangeNotifierProvider(create: (_) => IndustryDataViewModel()),
        ChangeNotifierProvider(create: (_) => SpecAndSubSpecViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => CompleteProfile1ViewModel()),
        ChangeNotifierProvider(create: (_) => CompleteProfile2ViewModel()),
        ChangeNotifierProvider(create: (_) => CompleteProfile3ViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: YourResume(),
      ),
    );
  }
}
