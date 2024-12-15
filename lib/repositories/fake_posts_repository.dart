import '../data/fake_posts_data_source.dart';
import '../models/post.dart';
import 'posts_repository.dart';

class FakePostsRepository implements PostsRepository {
  final FakePostsDataSource _dataSource;

  FakePostsRepository(this._dataSource);

  @override
  Future<List<Post>> getAllPosts() => _dataSource.getAllPosts();

  @override
  Future<Post> createPost(Post postToAdd) => _dataSource.createPost(postToAdd);

  @override
  Future<Post> updatePost(Post newPost) => _dataSource.updatePost(newPost);
}
