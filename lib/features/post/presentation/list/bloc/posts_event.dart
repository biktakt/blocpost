part of 'posts_bloc.dart';

sealed class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object> get props => [];
}

class PostsFetch extends PostsEvent {
  const PostsFetch();
}

class PostsRefresh extends PostsEvent {
  const PostsRefresh();
}
