import 'dart:io';

import 'package:dio/dio.dart';

import 'package:blocpost/core/error/exceptions.dart';

mixin RequestHelper {
  Future<T> handleRequest<T>(
    Future<Response> Function() request,
    T Function(dynamic) parser,
  ) async {
    try {
      final response = await request();

      final statusCode = response.statusCode ?? 0;
      if (statusCode != HttpStatus.ok) {
        Error.throwWithStackTrace(
          NetworkException('Unexpected status code: $statusCode'),
          StackTrace.current,
        );
      }

      return parser(response.data);
    } on DioException catch (e, stackTrace) {
      Error.throwWithStackTrace(
        NetworkException(e.message ?? 'Network exception'),
        stackTrace,
      );
    } on Object {
      rethrow;
    }
  }

  Future<List<T>> handleListRequest<T>(
    Future<Response> Function() request,
    T Function(dynamic) parser,
  ) async {
    return handleRequest<List<T>>(
      request,
      (data) => (data as List).map(parser).toList(),
    );
  }
}
