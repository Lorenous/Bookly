import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure(
            errMessage:
                'Connection timeout, please check your internet and try again!');
      case DioExceptionType.sendTimeout:
        return const ServerFailure(
            errMessage: 'Request took too long to send, please try again!');
      case DioExceptionType.receiveTimeout:
        return const ServerFailure(
            errMessage:
                'Server response took too long, please try again later!');
      case DioExceptionType.badCertificate:
        return const ServerFailure(
            errMessage:
                'Invalid security certificate from server, connection not secure!');
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return const ServerFailure(
            errMessage: 'Request was canceled, please try again!');
      case DioExceptionType.connectionError:
        return const ServerFailure(
            errMessage:
                'Failed to connect to server, please check your internet!');
      case DioExceptionType.unknown:
        return const ServerFailure(
            errMessage:
                'An unexpected error occurred, please try again later!');
    }
  }

  factory ServerFailure.fromBadResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return const ServerFailure(errMessage: 'Request Not Found');
    } else if (statusCode == 500) {
      return const ServerFailure(
          errMessage: 'Internal Server Error, please try again later!');
    } else {
      return const ServerFailure(
          errMessage: 'Oops there was an error, please try again later!');
    }
  }
}
