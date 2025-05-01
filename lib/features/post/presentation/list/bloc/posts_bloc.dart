import 'dart:developer';

import 'package:bloc_concurrency/bloc_concurrency.dart' show droppable;
import 'package:blocpost/core/error/exceptions.dart';
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
    on<PostsEvent>(_onFetch, transformer: droppable());
  }

  final GetPosts _getPosts;

  Future<void> _onFetch(PostsEvent event, Emitter<PostsState> emit) async {
    try {
      emit(PostsLoading());
      final posts = await _getPosts();
      emit(PostsLoaded(posts: posts));
    } on NetworkException catch (e) {
      log('NetworkException: ${e.message}');
      emit(const PostsLoadError(message: 'Network error'));
    } on Object catch (error, stackTrace) {
      onError(error, stackTrace);
      emit(const PostsLoadError(message: 'Error fetching posts'));
    }
  }
}
