import 'package:auto_route/auto_route.dart' show RoutePage;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocpost/core/di/injection.dart';
import 'package:blocpost/features/post/domain/usecases/get_post_by_id.dart';
import 'package:blocpost/features/post/presentation/landing/bloc/post_bloc.dart';
import 'package:blocpost/features/post/presentation/landing/widgets/post_widget.dart';

@RoutePage()
class PostLandingPage extends StatelessWidget {
  const PostLandingPage({super.key, required this.postId});

  final int postId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostBloc>(
      create:
          (_) =>
              PostBloc(id: postId, getPostById: sl<GetPostById>())
                ..add(const PostFetch()),
      child: const _PostLandingView(),
    );
  }
}

class _PostLandingView extends StatelessWidget {
  const _PostLandingView();

  @override
  Widget build(BuildContext context) {
    final postBloc = context.read<PostBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder:
            (context, state) => switch (state) {
              PostLoaded() => RefreshIndicator(
                onRefresh: () {
                  postBloc.add(const PostRefresh());
                  return Future.delayed(const Duration(microseconds: 300));
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: PostWidget(
                        id: state.post.id,
                        userId: state.post.userId,
                        title: state.post.title,
                        post: state.post.body,
                      ),
                    ),
                  ],
                ),
              ),
              PostLoadError() => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.message,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => postBloc.add(const PostFetch()),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
              _ => const Center(child: CircularProgressIndicator()),
            },
      ),
    );
  }
}
