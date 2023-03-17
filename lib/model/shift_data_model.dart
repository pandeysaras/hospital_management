// To parse this JSON data, do
//
//     final shiftDataModel = shiftDataModelFromJson(jsonString);

import 'dart:convert';

ShiftDataModel shiftDataModelFromJson(String str) => ShiftDataModel.fromJson(json.decode(str));

String shiftDataModelToJson(ShiftDataModel data) => json.encode(data.toJson());

class ShiftDataModel {
  ShiftDataModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<Datum> data;

  factory ShiftDataModel.fromJson(Map<String, dynamic> json) => ShiftDataModel(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.userId,
    required this.title,
    required this.startDate,
    required this.startTime,
    required this.status,
    required this.shiftTypes,
    required this.noOfProfessionals,
    required this.shiftDuration,
    required this.endDate,
    required this.endTime,
    required this.recurring,
    this.recurringType,
    this.recurringEndDate,
    required this.providerRate,
    required this.billRate,
    required this.providerBonus,
    required this.billRateBonus,
    required this.shiftConfirmationType,
    required this.providerRateCap,
    required this.specialityId,
    required this.credentialDocuments,
    required this.emrExperience,
    required this.describeAboutFacility,
    required this.shiftDescribe,
    required this.showShiftTo,
    this.favouritesId,
    required this.createdAt,
    required this.updatedAt,
    required this.subspecialityId,
    this.professionalLicence,
    this.requirements,
    this.facilityName,
    this.shiftSchedule,
    this.latitude,
    this.longitude,
    required this.users,
  });

  int id;
  int userId;
  String title;
  DateTime startDate;
  String startTime;
  String status;
  String shiftTypes;
  int noOfProfessionals;
  int shiftDuration;
  DateTime endDate;
  String endTime;
  int recurring;
  dynamic recurringType;
  dynamic recurringEndDate;
  int providerRate;
  int billRate;
  int providerBonus;
  int billRateBonus;
  int shiftConfirmationType;
  int providerRateCap;
  int specialityId;
  String credentialDocuments;
  String emrExperience;
  String describeAboutFacility;
  String shiftDescribe;
  int showShiftTo;
  dynamic favouritesId;
  DateTime createdAt;
  DateTime updatedAt;
  String subspecialityId;
  dynamic professionalLicence;
  dynamic requirements;
  dynamic facilityName;
  dynamic shiftSchedule;
  dynamic latitude;
  dynamic longitude;
  Users users;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    title: json["title"],
    startDate: DateTime.parse(json["start_date"]),
    startTime: json["start_time"],
    status: json["status"],
    shiftTypes: json["shift_types"],
    noOfProfessionals: json["no_of_professionals"],
    shiftDuration: json["shift_duration"],
    endDate: DateTime.parse(json["end_date"]),
    endTime: json["end_time"],
    recurring: json["recurring"],
    recurringType: json["recurring_type"],
    recurringEndDate: json["recurring_end_date"],
    providerRate: json["provider_rate"],
    billRate: json["bill_rate"],
    providerBonus: json["provider_bonus"],
    billRateBonus: json["bill_rate_bonus"],
    shiftConfirmationType: json["shift_confirmation_type"],
    providerRateCap: json["provider_rate_cap"],
    specialityId: json["speciality_id"],
    credentialDocuments: json["credential_documents"],
    emrExperience: json["emr_experience"],
    describeAboutFacility: json["describe_about_facility"],
    shiftDescribe: json["shift_describe"],
    showShiftTo: json["show_shift_to"],
    favouritesId: json["favourites_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    subspecialityId: json["subspeciality_id"],
    professionalLicence: json["professional_licence"],
    requirements: json["requirements"],
    facilityName: json["facility_name"],
    shiftSchedule: json["shift_schedule"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    users: Users.fromJson(json["users"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "title": title,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "start_time": startTime,
    "status": status,
    "shift_types": shiftTypes,
    "no_of_professionals": noOfProfessionals,
    "shift_duration": shiftDuration,
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "end_time": endTime,
    "recurring": recurring,
    "recurring_type": recurringType,
    "recurring_end_date": recurringEndDate,
    "provider_rate": providerRate,
    "bill_rate": billRate,
    "provider_bonus": providerBonus,
    "bill_rate_bonus": billRateBonus,
    "shift_confirmation_type": shiftConfirmationType,
    "provider_rate_cap": providerRateCap,
    "speciality_id": specialityId,
    "credential_documents": credentialDocuments,
    "emr_experience": emrExperience,
    "describe_about_facility": describeAboutFacility,
    "shift_describe": shiftDescribe,
    "show_shift_to": showShiftTo,
    "favourites_id": favouritesId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "subspeciality_id": subspecialityId,
    "professional_licence": professionalLicence,
    "requirements": requirements,
    "facility_name": facilityName,
    "shift_schedule": shiftSchedule,
    "latitude": latitude,
    "longitude": longitude,
    "users": users.toJson(),
  };
}

class Users {
  Users({
    required this.id,
    required this.typeId,
    this.username,
    required this.fieldOfWork,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.category,
    required this.profilePicture,
    required this.companyLogo,
    this.resume,
    this.gender,
    required this.dob,
    required this.aboutMe,
    required this.bio,
    required this.facebook,
    required this.instagram,
    required this.website,
    required this.addressLine1,
    required this.addressLine2,
    required this.latitude,
    required this.longitude,
    required this.city,
    required this.state,
    required this.zipcode,
    required this.country,
    required this.language,
    required this.walletBalance,
    required this.timezone,
    required this.activeToken,
    required this.resetPasswordToken,
    required this.emailVerification,
    this.remark,
    required this.lastLogin,
    required this.loginType,
    required this.isPlanUsed,
    required this.subscriptionEnd,
    required this.ipAddress,
    required this.status,
    required this.lastOnlineAt,
    this.createdBy,
    this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    this.twitter,
    this.accountName,
    this.emailVerificationCode,
    required this.mobileVerificationCode,
    required this.rating,
    required this.companyName,
    this.professionalLicence,
    required this.companyPhoto,
    required this.specialityId,
    required this.lunchBreak,
    required this.unpaidBreakTime,
    this.subspecialityId,
    this.promoCode,
    this.reference,
    required this.steps,
    this.socialSecurityNumber,
    required this.w9FormChk,
    this.industry,
    this.signatureFile,
    this.countryCode,
    this.facilityType,
    this.describeAboutFacility,
    this.shiftDescribe,
    this.accountPayableName,
    this.contactPersonName,
    this.accountPayableId,
    this.userId,
    this.reasonToSuspend,
    this.suspendType,
    this.suspendStartDate,
    this.suspendEndDate,
    this.shiftTypes,
    required this.thumb,
    required this.avatar,
  });

  int id;
  String typeId;
  dynamic username;
  String fieldOfWork;
  String name;
  String firstName;
  String lastName;
  String email;
  String phone;
  String category;
  String profilePicture;
  String companyLogo;
  dynamic resume;
  dynamic gender;
  DateTime dob;
  String aboutMe;
  String bio;
  String facebook;
  String instagram;
  String website;
  String addressLine1;
  String addressLine2;
  String latitude;
  String longitude;
  String city;
  String state;
  String zipcode;
  String country;
  int language;
  int walletBalance;
  int timezone;
  String activeToken;
  String resetPasswordToken;
  int emailVerification;
  dynamic remark;
  DateTime lastLogin;
  String loginType;
  String isPlanUsed;
  DateTime subscriptionEnd;
  String ipAddress;
  String status;
  DateTime lastOnlineAt;
  dynamic createdBy;
  dynamic updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic twitter;
  dynamic accountName;
  dynamic emailVerificationCode;
  String mobileVerificationCode;
  int rating;
  String companyName;
  dynamic professionalLicence;
  String companyPhoto;
  int specialityId;
  String lunchBreak;
  String unpaidBreakTime;
  dynamic subspecialityId;
  dynamic promoCode;
  dynamic reference;
  int steps;
  dynamic socialSecurityNumber;
  int w9FormChk;
  dynamic industry;
  dynamic signatureFile;
  dynamic countryCode;
  dynamic facilityType;
  dynamic describeAboutFacility;
  dynamic shiftDescribe;
  dynamic accountPayableName;
  dynamic contactPersonName;
  dynamic accountPayableId;
  dynamic userId;
  dynamic reasonToSuspend;
  dynamic suspendType;
  dynamic suspendStartDate;
  dynamic suspendEndDate;
  dynamic shiftTypes;
  String thumb;
  String avatar;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    id: json["id"],
    typeId: json["type_id"],
    username: json["username"],
    fieldOfWork: json["field_of_work"],
    name: json["name"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    phone: json["phone"],
    category: json["category"],
    profilePicture: json["profile_picture"],
    companyLogo: json["company_logo"],
    resume: json["resume"],
    gender: json["gender"],
    dob: DateTime.parse(json["dob"]),
    aboutMe: json["about_me"],
    bio: json["bio"],
    facebook: json["facebook"],
    instagram: json["instagram"],
    website: json["website"],
    addressLine1: json["address_line1"],
    addressLine2: json["address_line2"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    city: json["city"],
    state: json["state"],
    zipcode: json["zipcode"],
    country: json["country"],
    language: json["language"],
    walletBalance: json["wallet_balance"],
    timezone: json["timezone"],
    activeToken: json["active_token"],
    resetPasswordToken: json["reset_password_token"],
    emailVerification: json["email_verification"],
    remark: json["remark"],
    lastLogin: DateTime.parse(json["last_login"]),
    loginType: json["login_type"],
    isPlanUsed: json["is_plan_used"],
    subscriptionEnd: DateTime.parse(json["subscription_end"]),
    ipAddress: json["ip_address"],
    status: json["status"],
    lastOnlineAt: DateTime.parse(json["last_online_at"]),
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    twitter: json["twitter"],
    accountName: json["account_name"],
    emailVerificationCode: json["email_verification_code"],
    mobileVerificationCode: json["mobile_verification_code"],
    rating: json["rating"],
    companyName: json["company_name"],
    professionalLicence: json["professional_licence"],
    companyPhoto: json["company_photo"],
    specialityId: json["speciality_id"],
    lunchBreak: json["lunch_break"],
    unpaidBreakTime: json["unpaid_break_time"],
    subspecialityId: json["subspeciality_id"],
    promoCode: json["promo_code"],
    reference: json["reference"],
    steps: json["steps"],
    socialSecurityNumber: json["social_security_number"],
    w9FormChk: json["w9_form_chk"],
    industry: json["industry"],
    signatureFile: json["signature_file"],
    countryCode: json["country_code"],
    facilityType: json["facility_type"],
    describeAboutFacility: json["describe_about_facility"],
    shiftDescribe: json["shift_describe"],
    accountPayableName: json["account_payable_name"],
    contactPersonName: json["contact_person_name"],
    accountPayableId: json["account_payable_id"],
    userId: json["user_id"],
    reasonToSuspend: json["reason_to_suspend"],
    suspendType: json["suspend_type"],
    suspendStartDate: json["suspend_start_date"],
    suspendEndDate: json["suspend_end_date"],
    shiftTypes: json["shift_types"],
    thumb: json["thumb"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type_id": typeId,
    "username": username,
    "field_of_work": fieldOfWork,
    "name": name,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone": phone,
    "category": category,
    "profile_picture": profilePicture,
    "company_logo": companyLogo,
    "resume": resume,
    "gender": gender,
    "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "about_me": aboutMe,
    "bio": bio,
    "facebook": facebook,
    "instagram": instagram,
    "website": website,
    "address_line1": addressLine1,
    "address_line2": addressLine2,
    "latitude": latitude,
    "longitude": longitude,
    "city": city,
    "state": state,
    "zipcode": zipcode,
    "country": country,
    "language": language,
    "wallet_balance": walletBalance,
    "timezone": timezone,
    "active_token": activeToken,
    "reset_password_token": resetPasswordToken,
    "email_verification": emailVerification,
    "remark": remark,
    "last_login": lastLogin.toIso8601String(),
    "login_type": loginType,
    "is_plan_used": isPlanUsed,
    "subscription_end": "${subscriptionEnd.year.toString().padLeft(4, '0')}-${subscriptionEnd.month.toString().padLeft(2, '0')}-${subscriptionEnd.day.toString().padLeft(2, '0')}",
    "ip_address": ipAddress,
    "status": status,
    "last_online_at": lastOnlineAt.toIso8601String(),
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "twitter": twitter,
    "account_name": accountName,
    "email_verification_code": emailVerificationCode,
    "mobile_verification_code": mobileVerificationCode,
    "rating": rating,
    "company_name": companyName,
    "professional_licence": professionalLicence,
    "company_photo": companyPhoto,
    "speciality_id": specialityId,
    "lunch_break": lunchBreak,
    "unpaid_break_time": unpaidBreakTime,
    "subspeciality_id": subspecialityId,
    "promo_code": promoCode,
    "reference": reference,
    "steps": steps,
    "social_security_number": socialSecurityNumber,
    "w9_form_chk": w9FormChk,
    "industry": industry,
    "signature_file": signatureFile,
    "country_code": countryCode,
    "facility_type": facilityType,
    "describe_about_facility": describeAboutFacility,
    "shift_describe": shiftDescribe,
    "account_payable_name": accountPayableName,
    "contact_person_name": contactPersonName,
    "account_payable_id": accountPayableId,
    "user_id": userId,
    "reason_to_suspend": reasonToSuspend,
    "suspend_type": suspendType,
    "suspend_start_date": suspendStartDate,
    "suspend_end_date": suspendEndDate,
    "shift_types": shiftTypes,
    "thumb": thumb,
    "avatar": avatar,
  };
}
