import 'package:auto_route/auto_route.dart' show RoutePage;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocpost/core/di/injection.dart';
import 'package:blocpost/core/presentation/widgets/shimmer/shimmer.dart';
import 'package:blocpost/features/comment/domain/usecases/get_comments.dart';
import 'package:blocpost/features/comment/presentation/bloc/comments_bloc.dart';
import 'package:blocpost/features/comment/presentation/widgets/comment_card_shimmer_widget.dart';
import 'package:blocpost/features/comment/presentation/widgets/comment_card_widget.dart';
import 'package:blocpost/features/post/domain/entities/post.dart';
import 'package:blocpost/features/post/domain/usecases/get_post_by_id.dart';
import 'package:blocpost/features/post/presentation/list/widgets/post_card_shimmer_widget.dart';
import 'package:blocpost/features/post/presentation/single/bloc/post_bloc.dart';
import 'package:blocpost/features/post/presentation/single/widgets/post_widget.dart';

@RoutePage()
class CommentsPage extends StatelessWidget {
  const CommentsPage({super.key, required this.postId});

  final int postId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (_) =>
                  PostBloc(id: postId, getPostById: sl<GetPostById>())
                    ..add(const PostFetch()),
        ),
        BlocProvider(
          create:
              (_) =>
                  CommentsBloc(postId: postId, getComments: sl<GetComments>())
                    ..add(const CommentsFetch()),
        ),
      ],
      child: const _CommentsView(),
    );
  }
}

class _CommentsView extends StatelessWidget {
  const _CommentsView();

  @override
  Widget build(BuildContext context) {
    final postBloc = context.read<PostBloc>();
    final commentsBloc = context.read<CommentsBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          return switch (state) {
            PostLoaded() => RefreshIndicator(
              onRefresh: () {
                postBloc.add(const PostFetch());
                commentsBloc.add(const CommentsFetch());
                return Future.delayed(const Duration(milliseconds: 300));
              },
              child: _CommentsScrollView(post: state.post),
            ),
            PostLoadError() => _ErrorView(
              message: state.message,
              onRetry: () => postBloc.add(const PostFetch()),
            ),
            _ => const Shimmer(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: PostCardShimmerWidget(),
              ),
            ),
          };
        },
      ),
    );
  }
}

class _CommentsScrollView extends StatelessWidget {
  const _CommentsScrollView({required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: PostWidget(post: post),
          ),
        ),
        SliverToBoxAdapter(
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Discussion started',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
        const _CommentsSliver(),
        const SliverToBoxAdapter(child: SizedBox(height: 40)),
      ],
    );
  }
}

class _CommentsSliver extends StatelessWidget {
  const _CommentsSliver();

  Widget _buildCommentsList(BuildContext context, CommentsLoaded state) {
    if (state.comments.isEmpty) {
      return const SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text('No comments here yet...'),
          ),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: CommentCardWidget(comment: state.comments[index]),
        ),
        childCount: state.comments.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentsBloc, CommentsState>(
      builder:
          (context, state) => switch (state) {
            CommentsLoaded() => _buildCommentsList(context, state),
            CommentsLoadError() => SliverToBoxAdapter(
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.error,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    Text(state.message),
                  ],
                ),
              ),
            ),
            _ => const SliverToBoxAdapter(
              child: Shimmer(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: CommentCardShimmerWidget(),
                ),
              ),
            ),
          },
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}
