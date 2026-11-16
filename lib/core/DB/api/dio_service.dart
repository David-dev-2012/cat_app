import 'package:cat_app/core/DB/api/api_consumer.dart';
import 'package:cat_app/core/errors/server_exception.dart';
import 'package:cat_app/core/resources/api_consts.dart';
import 'package:cat_app/core/resources/app_strings.dart';
import 'package:dio/dio.dart';

class DioService implements ApiConsumer {
  final Dio dio;
  DioService(this.dio) {
    dio.options.baseUrl = ApiConsts.baseUrl;
    dio.interceptors.add(LogInterceptor());
  }

  @override
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(path, queryParameters: queryParameters);
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return response.data;
      } else {
        throw ServerException(
          message: response.statusMessage ?? AppStrings.requestFailed,
          statusCode: response.statusCode ?? 500,
          data: response.data as Map<String, dynamic>?,
        );
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw _handleEX(e);
    }
  }

  ServerException _handleEX(Object e) {
    if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          return ServerException(
            message: AppStrings.connectionTimeout,
            statusCode: 401,
            data: e.response?.data as Map<String, dynamic>?,
          );
        case DioExceptionType.receiveTimeout:
          return ServerException(
            message: AppStrings.receiveTimeout,
            statusCode: 402,
            data: e.response?.data as Map<String, dynamic>?,
          );
        case DioExceptionType.badCertificate:
          return ServerException(
            message: AppStrings.badCertificate,
            statusCode: 403,
            data: e.response?.data as Map<String, dynamic>?,
          );
        case DioExceptionType.connectionError:
          return ServerException(
            message: AppStrings.connectionError,
            statusCode: 404,
            data: e.response?.data as Map<String, dynamic>?,
          );
        case DioExceptionType.badResponse:
          return ServerException(
            message: e.response?.statusMessage ?? AppStrings.badResponse,
            statusCode: e.response?.statusCode ?? 400,
            data: e.response?.data as Map<String, dynamic>?,
          );
        case DioExceptionType.sendTimeout:
          return ServerException(
            message: AppStrings.sendTimeout,
            statusCode: 405,
            data: e.response?.data as Map<String, dynamic>?,
          );
        case DioExceptionType.cancel:
          return ServerException(
            message: AppStrings.requestCancelled,
            statusCode: 406,
            data: e.response?.data as Map<String, dynamic>?,
          );
        case DioExceptionType.unknown:
          return ServerException(
            message: e.message ?? AppStrings.unknownError,
            statusCode: 400,
            data: e.response?.data as Map<String, dynamic>?,
          );
        default:
          return ServerException(
            message: e.message ?? AppStrings.unexpectedError,
            statusCode: 400,
            data: e.response?.data as Map<String, dynamic>?,
          );
      }
    }
    return ServerException(
      message: e.toString(),
      statusCode: 500,
      data: null,
    );
  }
}
