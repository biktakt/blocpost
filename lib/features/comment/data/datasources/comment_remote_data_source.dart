import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:blocpost/core/remote/request_helper.dart';
import 'package:blocpost/features/comment/data/models/comment_model.dart';

abstract class CommentRemoteDataSource {
  /// Calls the [https://jsonplaceholder.typicode.com/comments] endpoint
  Future<List<CommentModel>> fetchComments({required int postId});
}

@LazySingleton(as: CommentRemoteDataSource)
class CommentRemoteDataSourceImpl
    with RequestHelper
    implements CommentRemoteDataSource {
  const CommentRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<List<CommentModel>> fetchComments({required int postId}) {
    return handleListRequest(
      () => _dio.get('/comments', queryParameters: {'postId': postId}),
      (json) => CommentModel.fromJson(json),
    );
  }
}
