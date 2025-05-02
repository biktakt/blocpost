import 'package:flutter/material.dart';

import 'package:blocpost/features/comment/domain/entities/comment.dart';

class CommentCardWidget extends StatelessWidget {
  const CommentCardWidget({super.key, required this.comment});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Text(
              comment.name[0].toUpperCase(),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comment.email,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    comment.body,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
