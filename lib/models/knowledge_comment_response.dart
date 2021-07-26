class KnowledgeCommentResponse {
  String? status;
  String? code;
  String? message;
  List<Payload>? payload;

  KnowledgeCommentResponse(
      {this.status, this.code, this.message, this.payload});

  KnowledgeCommentResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['payload'] != null) {
      payload = <Payload>[];
      json['payload'].forEach((v) {
        payload!.add(Payload.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    if (payload != null) {
      data['payload'] = payload!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Payload {
  int? id;
  String? comment;
  String? updateTime;
  String? createdBy;

  Payload({this.id, this.comment, this.updateTime, this.createdBy});

  Payload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    updateTime = json['update_time'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['comment'] = comment;
    data['update_time'] = updateTime;
    data['created_by'] = createdBy;
    return data;
  }
}
