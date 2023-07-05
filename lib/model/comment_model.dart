class CommentsModel {
  int? id;
  int? productId;
  String? comments;
  int? likes;
  String? createdAt;
  String? updatedAt;

  CommentsModel(
      {this.id,
      this.productId,
      this.comments,
      this.likes,
      this.createdAt,
      this.updatedAt});

  CommentsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    comments = json['comments'];
    likes = json['likes'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['comments'] = this.comments;
    data['likes'] = this.likes;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
