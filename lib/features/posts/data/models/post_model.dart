import '../../domain/entities/post.dart';

class PostModel extends Post {
  const PostModel(
      {int? id, required String title, required String body, int? userId})
      : super(id: id, title: title, body: body, userId: userId);

  // write constact with not required id

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        id: json['id'],
        title: json['title'],
        body: json['body'],
        userId: json['userId']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'body': body, 'userId': userId};
  }
}
