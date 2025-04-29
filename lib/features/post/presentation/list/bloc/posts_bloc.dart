import 'package:bloc_concurrency/bloc_concurrency.dart' show droppable;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocpost/features/post/domain/entities/post.dart';
import 'package:blocpost/features/post/domain/usecases/get_posts.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc({required GetPosts getPosts})
    : _getPosts = getPosts,
      super(PostsInitial()) {
    on<PostsFetch>(_onFetch, transformer: droppable());
    on<PostsRefresh>(_onFetch, transformer: droppable());
  }

  final GetPosts _getPosts;

  Future<void> _onFetch(PostsEvent event, Emitter<PostsState> emit) async {
    emit(PostsLoading());

    try {
      final posts = await _getPosts();
      emit(PostsLoaded(posts: posts));
    } on Object {
      emit(const PostsLoadError(message: 'Error fetching posts'));
      rethrow;
    }
  }
}
