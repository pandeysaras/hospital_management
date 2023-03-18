ListOfUploadedDataModel? golablListOfUploadedDataModel;

class ListOfUploadedDataModel {
  bool? status;
  String? message;
  List<Data>? data;

  ListOfUploadedDataModel({this.status, this.message, this.data});

  ListOfUploadedDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  String? file;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? certificateName;
  int? certificateId;

  Data(
      {this.id,
      this.userId,
      this.file,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.certificateName,
      this.certificateId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    file = json['file'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    certificateName = json['certificate_name'];
    certificateId = json['certificate_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['file'] = this.file;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['certificate_name'] = this.certificateName;
    data['certificate_id'] = this.certificateId;
    return data;
  }
}
