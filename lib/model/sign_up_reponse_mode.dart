class SignUpResponseModel {
  bool? status;
  String? message;
  User? user;
  String? steps;

  SignUpResponseModel({this.status, this.message, this.user, this.steps});

  SignUpResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? email;
  String? typeId;
  String? status;
  String? steps;
  String? loginType;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? thumb;
  String? avatar;

  User(
      {this.email,
      this.typeId,
      this.status,
      this.steps,
      this.loginType,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.thumb,
      this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    typeId = json['type_id'];
    status = json['status'];
    steps = json['steps'];
    loginType = json['login_type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    thumb = json['thumb'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['type_id'] = this.typeId;
    data['status'] = this.status;
    data['steps'] = this.steps;
    data['login_type'] = this.loginType;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['thumb'] = this.thumb;
    data['avatar'] = this.avatar;
    return data;
  }
}
