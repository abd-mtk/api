import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int? id;
  final String title;
  final String body;
  final int? userId;

  const Post({
    this.id,
    required this.title,
    required this.body,
    this.userId,
  });

  @override
  List<Object?> get props => [id, title, body, userId];
}
