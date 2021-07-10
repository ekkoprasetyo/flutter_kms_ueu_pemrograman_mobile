class UserData {
  int? id;
  String? nim;
  String? name;
  String? email;
  String? tokenbearer;

  UserData({this.id, this.nim, this.name, this.email, this.tokenbearer});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['areaid'] != null ? int.parse(json['id']) : 0;
    nim = json['nim'];
    name = json['name'];
    email = json['email'];
    tokenbearer = json['tokenbearer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nim'] = nim;
    data['name'] = name;
    data['email'] = email;
    data['tokenbearer'] = tokenbearer;
    return data;
  }
}
