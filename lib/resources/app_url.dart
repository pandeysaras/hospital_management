class AppUrl {
  //https://clickandstaff.ubuntugl.com
  static var baseUrl = "https://clickandstaff.com";

  //signup Url
  static var registerEndPoint = "$baseUrl/api/signup/step-1";

  static var enterNameEndPoint = "$baseUrl/api/signup/step-2";

  static var mobileNumberOTPEndPoint = "$baseUrl/api/signup/step-3";
  //upload profile pic
  static var uploadProfile = "$baseUrl/api/signup/step-4";

  //get how u heard about us
  static var getHearAboutUs = "$baseUrl/api/getHearAboutUsData";

  //upload post
  static var postHearaboutus = "$baseUrl/api/signup/step-9";

  //refrel
  static var refralEndPoint = "$baseUrl/api/signup/step-8";
  static var selectIndustryEndPoint = "$baseUrl/api/signup/step-5";
  static var selectSkillSetEndPoint = "$baseUrl/api/signup/step-6";
  static var selectSkillSetSubCatEndPoint = "$baseUrl/api/signup/step-7";
  static var industryDataEndPoint = "$baseUrl/api/getIndustryData";
  static var specialityIdEndPoint = "$baseUrl/api/getSpecialityData?id=";
  static var subSpecialityIdEndPoint = "$baseUrl/api/getSubSpecialityData?id=";
  static var loginEndPoint = "$baseUrl/api/login";

  //upload resume
  static var uploadResumeEndPoint = "$baseUrl/api/profile_info_step_4";
  //upload license
  static var uploadLicence = "$baseUrl/api/profile_info_step_5";

  //upload bank details
  static var bankdetailEndPoint = "$baseUrl/api/profile_info_step_6";

  //upload documents
  static var documetnsUplaoadEndpoint = "$baseUrl/api/profile_info_step_7";
  
  static var completeProfileInfo1EndPoint =
      "https://clickandstaff.com/api/profile_info_step_1";
  static var completeProfileInfo2EndPoint = "$baseUrl/api/profile_info_step_2";
  static var completeProfileInfo3EndPoint = "$baseUrl/api/profile_info_step_3";
  static var stateListEndPoint = "$baseUrl/api/get_state_list";
  static var licenseListEndPoint =
      "$baseUrl/api/get_professional_licence?id=23";

  static var stateEndPoint = "$baseUrl/api/get_state_list";

  static var getSUbspltyEndPoint = "$baseUrl/api/getSubSpecialityData?";
  static var getShiftDataEndPoint = "$baseUrl/api/get_shift_data?user_id=224";
  static var postBidShiftEndPoint = "$baseUrl/api/bid_shift";
}
