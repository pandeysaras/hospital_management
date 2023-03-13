StateDataModel? globalStateDataModel ;
class StateDataModel {
  bool? status;
  String? message;
  List<Data>? data;

  StateDataModel({this.status, this.message, this.data});

  StateDataModel.fromJson(Map<String, dynamic> json) {
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
  String? state;
  String? status;
  String? stateCode;

  Data({this.id, this.state, this.status, this.stateCode});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    state = json['state'];
    status = json['status'];
    stateCode = json['state_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['state'] = this.state;
    data['status'] = this.status;
    data['state_code'] = this.stateCode;
    return data;
  }
}
