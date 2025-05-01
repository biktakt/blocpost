part of 'comments_bloc.dart';

sealed class CommentsState extends Equatable {
  const CommentsState({this.postId});

  final int? postId;

  @override
  List<Object> get props => [];
}

final class CommentsInitial extends CommentsState {
  const CommentsInitial({super.postId});
}

final class CommentsLoading extends CommentsState {
  const CommentsLoading({super.postId});
}

final class CommentsLoaded extends CommentsState {
  const CommentsLoaded({super.postId, required this.comments});

  final List<Comment> comments;

  @override
  List<Object> get props => [comments];
}

final class CommentsLoadError extends CommentsState {
  const CommentsLoadError({super.postId, required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
