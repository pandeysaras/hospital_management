class MobileOTPResponseModel {
  bool? status;
  String? message;
  User? user;
  String? steps;

  MobileOTPResponseModel({this.status, this.message, this.user, this.steps});

  MobileOTPResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    steps = json['steps'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['steps'] = this.steps;
    return data;
  }
}

class User {
  int? id;
  String? typeId;
  dynamic? username;
  dynamic? fieldOfWork;
  dynamic? name;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  dynamic? category;
  String? profilePicture;
  dynamic? companyLogo;
  dynamic? resume;
  dynamic? gender;
  dynamic? dob;
  dynamic? aboutMe;
  dynamic? bio;
  dynamic? facebook;
  dynamic? instagram;
  dynamic? website;
  dynamic? addressLine1;
  dynamic? addressLine2;
  dynamic? latitude;
  dynamic? longitude;
  dynamic? city;
  dynamic? state;
  dynamic? zipcode;
  dynamic? country;
  dynamic? language;
  dynamic? walletBalance;
  dynamic? timezone;
  dynamic? activeToken;
  dynamic? resetPasswordToken;
  int? emailVerification;
  dynamic? remark;
  dynamic? lastLogin;
  String? loginType;
  String? isPlanUsed;
  dynamic? subscriptionEnd;
  dynamic? ipAddress;
  String? status;
  dynamic? lastOnlineAt;
  dynamic? createdBy;
  dynamic? updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic? twitter;
  dynamic? accountName;
  dynamic? emailVerificationCode;
  String? mobileVerificationCode;
  dynamic? rating;
  dynamic? companyName;
  dynamic? professionalLicence;
  dynamic? companyPhoto;
  int? specialityId;
  String? lunchBreak;
  Null? unpaidBreakTime;
  dynamic? subspecialityId;
  dynamic? promoCode;
  String? reference;
  dynamic? steps;
  dynamic? socialSecurityNumber;
  int? w9FormChk;
  String? thumb;
  String? avatar;

  User(
      {this.id,
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
      this.thumb,
      this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeId = json['type_id'];
    username = json['username'];
    fieldOfWork = json['field_of_work'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    category = json['category'];
    profilePicture = json['profile_picture'];
    companyLogo = json['company_logo'];
    resume = json['resume'];
    gender = json['gender'];
    dob = json['dob'];
    aboutMe = json['about_me'];
    bio = json['bio'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    website = json['website'];
    addressLine1 = json['address_line1'];
    addressLine2 = json['address_line2'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    city = json['city'];
    state = json['state'];
    zipcode = json['zipcode'];
    country = json['country'];
    language = json['language'];
    walletBalance = json['wallet_balance'];
    timezone = json['timezone'];
    activeToken = json['active_token'];
    resetPasswordToken = json['reset_password_token'];
    emailVerification = json['email_verification'];
    remark = json['remark'];
    lastLogin = json['last_login'];
    loginType = json['login_type'];
    isPlanUsed = json['is_plan_used'];
    subscriptionEnd = json['subscription_end'];
    ipAddress = json['ip_address'];
    status = json['status'];
    lastOnlineAt = json['last_online_at'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    twitter = json['twitter'];
    accountName = json['account_name'];
    emailVerificationCode = json['email_verification_code'];
    mobileVerificationCode = json['mobile_verification_code'];
    rating = json['rating'];
    companyName = json['company_name'];
    professionalLicence = json['professional_licence'];
    companyPhoto = json['company_photo'];
    specialityId = json['speciality_id'];
    lunchBreak = json['lunch_break'];
    unpaidBreakTime = json['unpaid_break_time'];
    subspecialityId = json['subspeciality_id'];
    promoCode = json['promo_code'];
    reference = json['reference'];
    steps = json['steps'];
    socialSecurityNumber = json['social_security_number'];
    w9FormChk = json['w9_form_chk'];
    thumb = json['thumb'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type_id'] = this.typeId;
    data['username'] = this.username;
    data['field_of_work'] = this.fieldOfWork;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['category'] = this.category;
    data['profile_picture'] = this.profilePicture;
    data['company_logo'] = this.companyLogo;
    data['resume'] = this.resume;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['about_me'] = this.aboutMe;
    data['bio'] = this.bio;
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    data['website'] = this.website;
    data['address_line1'] = this.addressLine1;
    data['address_line2'] = this.addressLine2;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zipcode'] = this.zipcode;
    data['country'] = this.country;
    data['language'] = this.language;
    data['wallet_balance'] = this.walletBalance;
    data['timezone'] = this.timezone;
    data['active_token'] = this.activeToken;
    data['reset_password_token'] = this.resetPasswordToken;
    data['email_verification'] = this.emailVerification;
    data['remark'] = this.remark;
    data['last_login'] = this.lastLogin;
    data['login_type'] = this.loginType;
    data['is_plan_used'] = this.isPlanUsed;
    data['subscription_end'] = this.subscriptionEnd;
    data['ip_address'] = this.ipAddress;
    data['status'] = this.status;
    data['last_online_at'] = this.lastOnlineAt;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['twitter'] = this.twitter;
    data['account_name'] = this.accountName;
    data['email_verification_code'] = this.emailVerificationCode;
    data['mobile_verification_code'] = this.mobileVerificationCode;
    data['rating'] = this.rating;
    data['company_name'] = this.companyName;
    data['professional_licence'] = this.professionalLicence;
    data['company_photo'] = this.companyPhoto;
    data['speciality_id'] = this.specialityId;
    data['lunch_break'] = this.lunchBreak;
    data['unpaid_break_time'] = this.unpaidBreakTime;
    data['subspeciality_id'] = this.subspecialityId;
    data['promo_code'] = this.promoCode;
    data['reference'] = this.reference;
    data['steps'] = this.steps;
    data['social_security_number'] = this.socialSecurityNumber;
    data['w9_form_chk'] = this.w9FormChk;
    data['thumb'] = this.thumb;
    data['avatar'] = this.avatar;
    return data;
  }
}













