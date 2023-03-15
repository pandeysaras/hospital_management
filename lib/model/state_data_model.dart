class StateDataModel {
  bool? status;
  String? message;
  List<States>? states;

  StateDataModel({this.status, this.message, this.states});

  StateDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      states = <States>[];
      json['data'].forEach((v) {
        states!.add(new States.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.states != null) {
      data['data'] = this.states!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class States {
  int? id;
  String? state;
  String? status;
  String? stateCode;

  States({this.id, this.state, this.status, this.stateCode});

  States.fromJson(Map<String, dynamic> json) {
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
