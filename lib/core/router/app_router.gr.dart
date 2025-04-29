// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [PostLandingPage]
class PostLandingRoute extends PageRouteInfo<PostLandingRouteArgs> {
  PostLandingRoute({
    Key? key,
    required int postId,
    List<PageRouteInfo>? children,
  }) : super(
         PostLandingRoute.name,
         args: PostLandingRouteArgs(key: key, postId: postId),
         initialChildren: children,
       );

  static const String name = 'PostLandingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PostLandingRouteArgs>();
      return PostLandingPage(key: args.key, postId: args.postId);
    },
  );
}

class PostLandingRouteArgs {
  const PostLandingRouteArgs({this.key, required this.postId});

  final Key? key;

  final int postId;

  @override
  String toString() {
    return 'PostLandingRouteArgs{key: $key, postId: $postId}';
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
