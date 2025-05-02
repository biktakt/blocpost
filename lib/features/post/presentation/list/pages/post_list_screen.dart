import 'package:auto_route/auto_route.dart' show RoutePage;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocpost/core/di/injection.dart';
import 'package:blocpost/features/post/domain/usecases/get_posts.dart';
import 'package:blocpost/features/post/presentation/list/bloc/posts_bloc.dart';
import 'package:blocpost/features/post/presentation/list/widgets/post_card_widget.dart';

@RoutePage()
class PostListPage extends StatelessWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostsBloc>(
      create:
          (_) => PostsBloc(getPosts: sl<GetPosts>())..add(const PostsFetch()),
      child: const _PostListView(),
    );
  }
}

class _PostListView extends StatelessWidget {
  const _PostListView();

  @override
  Widget build(BuildContext context) {
    final postBloc = context.read<PostsBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Postbloc'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder:
            (context, state) => switch (state) {
              PostsLoaded() => RefreshIndicator(
                onRefresh: () {
                  postBloc.add(const PostsRefresh());
                  return Future.delayed(const Duration(microseconds: 300));
                },
                child: ListView.builder(
                  itemBuilder:
                      (context, index) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: PostCardWidget(post: state.posts[index]),
                      ),
                  itemCount: state.posts.length,
                ),
              ),
              PostsLoadError() => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.message,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => postBloc.add(const PostsFetch()),
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
