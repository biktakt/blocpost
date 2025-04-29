import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:blocpost/features/post/presentation/landing/pages/post_landing_screen.dart';
import 'package:blocpost/features/post/presentation/list/pages/post_list_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: PostListRoute.page, path: '/'),
    AutoRoute(page: PostLandingRoute.page, path: '/post/:id'),
  ];
}
