import 'package:injectable/injectable.dart';

import 'package:blocpost/features/comment/data/datasources/comment_remote_data_source.dart';
import 'package:blocpost/features/comment/domain/entities/comment.dart';
import 'package:blocpost/features/comment/domain/repositories/comment_repository.dart';

@LazySingleton(as: CommentRepository)
class CommentRepositoryImpl implements CommentRepository {
  const CommentRepositoryImpl({required this.postRemoteDataSource});

  final CommentRemoteDataSource postRemoteDataSource;

  @override
  Future<List<Comment>> fetchComments({int? postId}) {
    return postRemoteDataSource.fetchComments(postId: postId);
  }

  @override
  Future<Comment> fetchCommentById(int id) {
    return postRemoteDataSource.fetchCommentById(id);
  }
}
