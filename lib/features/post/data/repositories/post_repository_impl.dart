import 'package:injectable/injectable.dart';

import 'package:blocpost/features/post/data/datasources/post_remote_data_source.dart';
import 'package:blocpost/features/post/domain/entities/post.dart';
import 'package:blocpost/features/post/domain/repositories/post_repository.dart';

@LazySingleton(as: PostRepository)
class PostRepositoryImpl implements PostRepository {
  const PostRepositoryImpl({required this.postRemoteDataSource});

  final PostRemoteDataSource postRemoteDataSource;

  @override
  Future<List<Post>> fetchPosts() {
    return postRemoteDataSource.fetchPosts();
  }

  @override
  Future<Post> fetchPostById(int id) {
    return postRemoteDataSource.fetchPostById(id);
  }
}
