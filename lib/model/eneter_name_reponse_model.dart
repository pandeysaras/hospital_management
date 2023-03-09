// To parse this JSON data, do
//
//     final enterNameResponseModel = enterNameResponseModelFromJson(jsonString);

import 'dart:convert';

EnterNameResponseModel enterNameResponseModelFromJson(String str) => EnterNameResponseModel.fromJson(json.decode(str));

String enterNameResponseModelToJson(EnterNameResponseModel data) => json.encode(data.toJson());

class EnterNameResponseModel {
  EnterNameResponseModel({
    this.status,
    this.message,
    this.user,
    this.steps,
  });

  bool? status;
  String? message;
  User? user;
  String? steps;

  factory EnterNameResponseModel.fromJson(Map<String, dynamic> json) => EnterNameResponseModel(
    status: json["status"],
    message: json["message"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    steps: json["steps"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "user": user?.toJson(),
    "steps": steps,
  };
}

class User {
  User({
    this.id,
    this.typeId,
    this.username,
    this.fieldOfWork,
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.category,
    this.profilePicture,
    this.companyLogo,
    this.resume,
    this.gender,
    this.dob,
    this.aboutMe,
    this.bio,
    this.facebook,
    this.instagram,
    this.website,
    this.addressLine1,
    this.addressLine2,
    this.latitude,
    this.longitude,
    this.city,
    this.state,
    this.zipcode,
    this.country,
    this.language,
    this.walletBalance,
    this.timezone,
    this.activeToken,
    this.resetPasswordToken,
    this.emailVerification,
    this.remark,
    this.lastLogin,
    this.loginType,
    this.isPlanUsed,
    this.subscriptionEnd,
    this.ipAddress,
    this.status,
    this.lastOnlineAt,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.twitter,
    this.accountName,
    this.emailVerificationCode,
    this.mobileVerificationCode,
    this.rating,
    this.companyName,
    this.professionalLicence,
    this.companyPhoto,
    this.specialityId,
    this.lunchBreak,
    this.unpaidBreakTime,
    this.subspecialityId,
    this.promoCode,
    this.reference,
    this.steps,
    this.socialSecurityNumber,
    this.w9FormChk,
    this.industry,
    this.signatureFile,
    this.countryCode,
    this.thumb,
    this.avatar,
  });

  int? id;
  String? typeId;
  String? username;
  dynamic fieldOfWork;
  String? name;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  dynamic category;
  String? profilePicture;
  dynamic companyLogo;
  dynamic resume;
  dynamic gender;
  DateTime? dob;
  dynamic aboutMe;
  dynamic bio;
  dynamic facebook;
  dynamic instagram;
  dynamic website;
  String? addressLine1;
  String? addressLine2;
  dynamic latitude;
  dynamic longitude;
  String? city;
  String? state;
  String? zipcode;
  dynamic country;
  dynamic language;
  dynamic walletBalance;
  dynamic timezone;
  dynamic activeToken;
  dynamic resetPasswordToken;
  int? emailVerification;
  dynamic remark;
  dynamic lastLogin;
  String? loginType;
  String? isPlanUsed;
  dynamic subscriptionEnd;
  dynamic ipAddress;
  String? status;
  dynamic lastOnlineAt;
  dynamic createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic twitter;
  dynamic accountName;
  dynamic emailVerificationCode;
  String? mobileVerificationCode;
  int? rating;
  dynamic companyName;
  dynamic professionalLicence;
  dynamic companyPhoto;
  int? specialityId;
  String? lunchBreak;
  dynamic unpaidBreakTime;
  String? subspecialityId;
  dynamic promoCode;
  String? reference;
  int? steps;
  int? socialSecurityNumber;
  int? w9FormChk;
  int? industry;
  String? signatureFile;
  String? countryCode;
  String? thumb;
  String? avatar;

  factory User.fromJson(Map<String, dynamic> json) => User(
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
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
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
    lastLogin: json["last_login"],
    loginType: json["login_type"],
    isPlanUsed: json["is_plan_used"],
    subscriptionEnd: json["subscription_end"],
    ipAddress: json["ip_address"],
    status: json["status"],
    lastOnlineAt: json["last_online_at"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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
    "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
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
    "last_login": lastLogin,
    "login_type": loginType,
    "is_plan_used": isPlanUsed,
    "subscription_end": subscriptionEnd,
    "ip_address": ipAddress,
    "status": status,
    "last_online_at": lastOnlineAt,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
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
    "thumb": thumb,
    "avatar": avatar,
  };
}
