part of 'comments_bloc.dart';

sealed class CommentsEvent extends Equatable {
  const CommentsEvent();

  @override
  List<Object> get props => [];
}

class CommentsFetch extends CommentsEvent {
  const CommentsFetch();
}
