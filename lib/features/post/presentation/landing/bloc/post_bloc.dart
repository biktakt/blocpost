import 'package:bloc_concurrency/bloc_concurrency.dart' show droppable;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocpost/features/post/domain/entities/post.dart';
import 'package:blocpost/features/post/domain/usecases/get_post_by_id.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({required this.id, required GetPostById getPostById})
    : _getPost = getPostById,
      super(PostInitial(id: id)) {
    on<PostEvent>(_onFetch, transformer: droppable());
  }

  final GetPostById _getPost;
  final int id;

  Future<void> _onFetch(PostEvent event, Emitter<PostState> emit) async {
    emit(PostLoading(id: id));

    try {
      final post = await _getPost(id);
      emit(PostLoaded(id: id, post: post));
    } on Object {
      emit(PostLoadError(id: id, message: 'Error fetching posts'));
      rethrow;
    }
  }
}
