import '../models/post.dart';

abstract class PostsRepository {
  Future<List<Post>> getAllPosts();
  Future<Post> createPost(Post postToAdd);
  Future<Post> updatePost(Post newPost);
}
