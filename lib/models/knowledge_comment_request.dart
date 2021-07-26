class KnowledgeCommentRequest {
  int? id;
  String? comment;
  int? user;

  KnowledgeCommentRequest({this.id, this.comment, this.user});

  KnowledgeCommentRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['comment'] = comment;
    data['user'] = user;
    return data;
  }
}
