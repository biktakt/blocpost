part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState({required this.id});

  final int id;

  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {
  const PostInitial({required super.id});
}

final class PostLoading extends PostState {
  const PostLoading({required super.id});
}

final class PostLoaded extends PostState {
  const PostLoaded({required super.id, required this.post});

  final Post post;

  @override
  List<Object> get props => [id, post];
}

final class PostLoadError extends PostState {
  const PostLoadError({required super.id, required this.message});

  final String message;

  @override
  List<Object> get props => [id, message];
}
