import 'dart:developer';

import 'package:bloc_concurrency/bloc_concurrency.dart' show droppable;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocpost/core/error/exceptions.dart';
import 'package:blocpost/features/comment/domain/entities/comment.dart';
import 'package:blocpost/features/comment/domain/usecases/get_comments.dart';

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  CommentsBloc({this.postId, required GetComments getComments})
    : _getComments = getComments,
      super(CommentsInitial(postId: postId)) {
    on<CommentsEvent>(_onFetch, transformer: droppable());
  }

  final GetComments _getComments;
  final int? postId;

  Future<void> _onFetch(
    CommentsEvent event,
    Emitter<CommentsState> emit,
  ) async {
    try {
      emit(CommentsLoading(postId: postId));
      final comments = await _getComments(postId: postId);
      emit(CommentsLoaded(comments: comments));
    } on NetworkException catch (e) {
      log('NetworkException: ${e.message}');
      emit(const CommentsLoadError(message: 'Network error'));
    } on Object catch (error, stackTrace) {
      onError(error, stackTrace);
      emit(const CommentsLoadError(message: 'Error fetching comments'));
    }
  }
}
