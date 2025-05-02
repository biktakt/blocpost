import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:blocpost/core/router/screens.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: PostListRoute.page, path: '/'),
    AutoRoute(page: CommentsRoute.page, path: '/post/:id/comments'),
  ];
}
