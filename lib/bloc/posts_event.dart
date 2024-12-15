import 'package:equatable/equatable.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object> get props => [];
}

class LoadPosts extends PostsEvent {}

class AddPost extends PostsEvent {
  final String title;
  final String description;

  const AddPost({required this.title, required this.description});

  @override
  List<Object> get props => [title, description];
}

class UpdatePost extends PostsEvent {
  final String id;
  final String title;
  final String description;

  const UpdatePost({
    required this.id,
    required this.title,
    required this.description,
  });

  @override
  List<Object> get props => [id, title, description];
}
