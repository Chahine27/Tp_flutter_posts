import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/post.dart';
import '../repositories/posts_repository.dart';
import 'posts_event.dart';
import 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepository postsRepository;

  PostsBloc(this.postsRepository) : super(PostsInitial()) {
    on<LoadPosts>(_onLoadPosts);
    on<AddPost>(_onAddPost);
    on<UpdatePost>(_onUpdatePost);
  }

  void _onLoadPosts(LoadPosts event, Emitter<PostsState> emit) async {
    emit(PostsLoading());
    try {
      final posts = await postsRepository.getAllPosts();
      emit(PostsLoaded(posts));
    } catch (e) {
      emit(PostsError("Failed to load posts"));
    }
  }

  void _onAddPost(AddPost event, Emitter<PostsState> emit) async {
    if (state is PostsLoaded) {
      final currentPosts = (state as PostsLoaded).posts;
      try {
        int newId = currentPosts.isNotEmpty
            ? int.parse(currentPosts.last.id) + 1
            : 1;

        final newPost = await postsRepository.createPost(
          Post(
            id: newId.toString(),
            title: event.title,
            description: event.description,
          ),
        );

        final updatedPosts = List<Post>.from(currentPosts)..add(newPost);
        emit(PostsLoaded(updatedPosts));
        add(LoadPosts());

      } catch (e) {
        emit(PostsError("Failed to add post"));
      }
    }
  }

  void _onUpdatePost(UpdatePost event, Emitter<PostsState> emit) async {
    try {
      await postsRepository.updatePost(
        Post(id: event.id, title: event.title, description: event.description),
      );
      add(LoadPosts());
    } catch (e) {
      emit(PostsError("Failed to update post"));
    }
  }
}


