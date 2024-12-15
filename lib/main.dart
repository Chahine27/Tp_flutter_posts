import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/posts_bloc.dart';
import 'bloc/posts_event.dart';
import 'repositories/fake_posts_repository.dart';
import 'data/fake_posts_data_source.dart';
import 'screens/posts_list_screen.dart';

void main() {
  final postsRepository = FakePostsRepository(FakePostsDataSource());
  runApp(MyApp(postsRepository: postsRepository));
}

class MyApp extends StatelessWidget {
  final FakePostsRepository postsRepository;

  const MyApp({Key? key, required this.postsRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsBloc(postsRepository)..add(LoadPosts()),
      child: MaterialApp(
        title: 'TP Flutter Posts',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: PostsListScreen(),
      ),
    );
  }
}
