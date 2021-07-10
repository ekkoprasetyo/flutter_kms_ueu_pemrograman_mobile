class KnowledgeResponse {
  String? status;
  String? code;
  String? message;
  List<Payload>? payload;

  KnowledgeResponse({this.status, this.code, this.message, this.payload});

  KnowledgeResponse.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? content;
  String? tags;
  String? updateTime;
  String? createdBy;

  Payload(
      {this.id,
      this.title,
      this.content,
      this.tags,
      this.updateTime,
      this.createdBy});

  Payload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    tags = json['tags'];
    updateTime = json['update_time'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['tags'] = tags;
    data['update_time'] = updateTime;
    data['created_by'] = createdBy;
    return data;
  }
}
