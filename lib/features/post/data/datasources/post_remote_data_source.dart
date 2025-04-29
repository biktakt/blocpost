import 'dart:io' show HttpStatus;

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:blocpost/features/post/data/models/post_model.dart';

abstract class PostRemoteDataSource {
  /// Calls the [https://jsonplaceholder.typicode.com/posts] endpoint
  Future<List<PostModel>> fetchPosts();

  /// Calls the [https://jsonplaceholder.typicode.com/posts/{id}] endpoint
  Future<PostModel> fetchPostById(int id);
}

@LazySingleton(as: PostRemoteDataSource)
class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  const PostRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<List<PostModel>> fetchPosts() async {
    try {
      final response = await _dio.get('/posts');
      if (response.statusCode == HttpStatus.ok) {
        return (response.data as List)
            .map((json) => PostModel.fromJson(json))
            .toList();
      }

      throw Exception(
        'Status Code: ${response.statusCode}, Message: ${response.statusMessage}',
      );
    } on Object {
      rethrow;
    }
  }

  @override
  Future<PostModel> fetchPostById(int id) async {
    try {
      final response = await _dio.get('/posts/$id');
      if (response.statusCode == HttpStatus.ok) {
        return PostModel.fromJson(response.data);
      }

      throw Exception(
        'Status Code: ${response.statusCode}, Message: ${response.statusMessage}',
      );
    } on Object {
      rethrow;
    }
  }
}
