import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:blocpost/core/router/app_router.dart';
import 'package:blocpost/features/post/domain/entities/post.dart';

class PostCardWidget extends StatelessWidget {
  const PostCardWidget({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: InkWell(
        onTap:
            () => AutoRouter.of(context).push(CommentsRoute(postId: post.id)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.title,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(post.body, style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ),
      ),
    );
  }
}
