import 'package:injectable/injectable.dart';

import 'package:blocpost/features/post/domain/entities/post.dart';
import 'package:blocpost/features/post/domain/repositories/post_repository.dart';

@injectable
class GetPosts {
  const GetPosts(this.repository);

  final PostRepository repository;

  Future<List<Post>> call() async {
    return await repository.fetchPosts();
  }
}
