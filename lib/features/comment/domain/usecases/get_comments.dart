import 'package:injectable/injectable.dart';

import 'package:blocpost/features/comment/domain/entities/comment.dart';
import 'package:blocpost/features/comment/domain/repositories/comment_repository.dart';

@injectable
class GetComments {
  const GetComments(this.repository);

  final CommentRepository repository;

  Future<List<Comment>> call({required int postId}) async {
    return await repository.fetchComments(postId: postId);
  }
}
