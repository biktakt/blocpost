import 'package:blocpost/features/post/domain/entities/post.dart';

abstract class PostRepository {
  Future<List<Post>> fetchPosts();
  Future<Post> fetchPostById(int id);
}
