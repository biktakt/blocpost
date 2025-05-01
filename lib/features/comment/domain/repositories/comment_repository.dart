import 'package:blocpost/features/comment/domain/entities/comment.dart';

abstract class CommentRepository {
  Future<List<Comment>> fetchComments({int? id, int? postId});
}
