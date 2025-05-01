import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:blocpost/core/remote/request_helper.dart';
import 'package:blocpost/features/post/data/models/post_model.dart';

abstract class PostRemoteDataSource {
  /// Calls the [https://jsonplaceholder.typicode.com/posts] endpoint
  Future<List<PostModel>> fetchPosts();

  /// Calls the [https://jsonplaceholder.typicode.com/posts/{id}] endpoint
  Future<PostModel> fetchPostById(int id);
}

@LazySingleton(as: PostRemoteDataSource)
class PostRemoteDataSourceImpl
    with RequestHelper
    implements PostRemoteDataSource {
  const PostRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<List<PostModel>> fetchPosts() {
    return handleListRequest(
      () => _dio.get('/posts'),
      (json) => PostModel.fromJson(json),
    );
  }

  @override
  Future<PostModel> fetchPostById(int id) {
    return handleRequest(
      () => _dio.get('/posts/$id'),
      (json) => PostModel.fromJson(json),
    );
  }
}
