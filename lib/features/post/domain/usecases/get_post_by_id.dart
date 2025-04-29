import 'package:injectable/injectable.dart';

import 'package:blocpost/features/post/domain/entities/post.dart';
import 'package:blocpost/features/post/domain/repositories/post_repository.dart';

@injectable
class GetPostById {
  const GetPostById(this.repository);

  final PostRepository repository;

  Future<Post> call(int id) async {
    return await repository.fetchPostById(id);
  }
}
