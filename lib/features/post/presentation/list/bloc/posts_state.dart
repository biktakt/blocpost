part of 'posts_bloc.dart';

sealed class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

final class PostsInitial extends PostsState {}

final class PostsLoading extends PostsState {}

final class PostsLoaded extends PostsState {
  const PostsLoaded({required this.posts});

  final List<Post> posts;

  @override
  List<Object> get props => [posts];
}

final class PostsLoadError extends PostsState {
  const PostsLoadError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
