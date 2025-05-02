// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [CommentsPage]
class CommentsRoute extends PageRouteInfo<CommentsRouteArgs> {
  CommentsRoute({Key? key, required int postId, List<PageRouteInfo>? children})
    : super(
        CommentsRoute.name,
        args: CommentsRouteArgs(key: key, postId: postId),
        initialChildren: children,
      );

  static const String name = 'CommentsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CommentsRouteArgs>();
      return CommentsPage(key: args.key, postId: args.postId);
    },
  );
}

class CommentsRouteArgs {
  const CommentsRouteArgs({this.key, required this.postId});

  final Key? key;

  final int postId;

  @override
  String toString() {
    return 'CommentsRouteArgs{key: $key, postId: $postId}';
  }
}

/// generated route for
/// [PostListPage]
class PostListRoute extends PageRouteInfo<void> {
  const PostListRoute({List<PageRouteInfo>? children})
    : super(PostListRoute.name, initialChildren: children);

  static const String name = 'PostListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PostListPage();
    },
  );
}
