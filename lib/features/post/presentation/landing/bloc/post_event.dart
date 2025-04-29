part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class PostFetch extends PostEvent {
  const PostFetch();
}

class PostRefresh extends PostEvent {
  const PostRefresh();
}
