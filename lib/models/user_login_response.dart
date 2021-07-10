class UserLoginResponse {
  String? status;
  String? code;
  String? message;
  Payload? payload;

  UserLoginResponse({this.status, this.code, this.message, this.payload});

  UserLoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    payload =
        json['payload'] != null ? Payload.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    if (payload != null) {
      data['payload'] = payload!.toJson();
    }
    return data;
  }
}

class Payload {
  int? cUsersId;
  String? cUsersnim;
  String? cUsersFullname;
  String? cUsersEmail;
  String? cUsersPosition;
  String? cUsersRole;
  String? cUsersStatus;
  String? cUsersUpdateBy;
  String? cUsersUpdateTime;
  String? cUsersLastLoginim;
  String? cUsersLastLoginDate;
  int? cUsersSoftdelete;
  String? cUsersTokenBearer;

  Payload(
      {this.cUsersId,
      this.cUsersnim,
      this.cUsersFullname,
      this.cUsersEmail,
      this.cUsersPosition,
      this.cUsersRole,
      this.cUsersStatus,
      this.cUsersUpdateBy,
      this.cUsersUpdateTime,
      this.cUsersLastLoginim,
      this.cUsersLastLoginDate,
      this.cUsersSoftdelete,
      this.cUsersTokenBearer});

  Payload.fromJson(Map<String, dynamic> json) {
    cUsersId = json['c_users_id'];
    cUsersnim = json['c_users_nim'];
    cUsersFullname = json['c_users_fullname'];
    cUsersEmail = json['c_users_email'];
    cUsersPosition = json['c_users_position'];
    cUsersRole = json['c_users_role'];
    cUsersStatus = json['c_users_status'];
    cUsersUpdateBy = json['c_users_update_by'];
    cUsersUpdateTime = json['c_users_update_time'];
    cUsersLastLoginim = json['c_users_last_login_ip'];
    cUsersLastLoginDate = json['c_users_last_login_date'];
    cUsersSoftdelete = json['c_users_softdelete'];
    cUsersTokenBearer = json['c_users_token_bearer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['c_users_id'] = cUsersId;
    data['c_users_nim'] = cUsersnim;
    data['c_users_fullname'] = cUsersFullname;
    data['c_users_email'] = cUsersEmail;
    data['c_users_position'] = cUsersPosition;
    data['c_users_role'] = cUsersRole;
    data['c_users_status'] = cUsersStatus;
    data['c_users_update_by'] = cUsersUpdateBy;
    data['c_users_update_time'] = cUsersUpdateTime;
    data['c_users_last_login_ip'] = cUsersLastLoginim;
    data['c_users_last_login_date'] = cUsersLastLoginDate;
    data['c_users_softdelete'] = cUsersSoftdelete;
    data['c_users_token_bearer'] = cUsersTokenBearer;
    return data;
  }
}
