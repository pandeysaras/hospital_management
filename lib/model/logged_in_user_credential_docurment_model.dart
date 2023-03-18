class LoggedInUserCredentialDocumentModel {
  bool? status;
  String? message;
  List<Data>? data;

  LoggedInUserCredentialDocumentModel({this.status, this.message, this.data});

  LoggedInUserCredentialDocumentModel.fromJson(Map<String, dynamic> json) {
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
  String? documentName;
  String? licenceNumber;
  String? licenceIssueDate;
  String? licenceExpiry;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? documentId;

  Data(
      {this.id,
        this.userId,
        this.file,
        this.documentName,
        this.licenceNumber,
        this.licenceIssueDate,
        this.licenceExpiry,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.documentId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    file = json['file'];
    documentName = json['document_name'];
    licenceNumber = json['licence_number'];
    licenceIssueDate = json['licence_issue_date'];
    licenceExpiry = json['licence_expiry'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    documentId = json['document_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['file'] = this.file;
    data['document_name'] = this.documentName;
    data['licence_number'] = this.licenceNumber;
    data['licence_issue_date'] = this.licenceIssueDate;
    data['licence_expiry'] = this.licenceExpiry;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['document_id'] = this.documentId;
    return data;
  }
}
