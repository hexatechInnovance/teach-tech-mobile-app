import 'package:dio/dio.dart';
import 'package:teach_tech_mobile/app/log.dart';
import 'package:teach_tech_mobile/app/network/dio_provider.dart';
import 'package:teach_tech_mobile/app/network/error_handlers.dart';
import 'package:teach_tech_mobile/app/network/exceptions/base_exception.dart';
import 'package:teach_tech_mobile/app/network/exceptions/network_exception.dart';

abstract class BaseRemoteSource {
  Dio get dioClient => DioProvider.dioClient;

  Dio get plainDio => DioProvider.plainDio;

  Dio get dioClientWithoutRetry => DioProvider.dioClientWithoutRetry;

  Future<Response<T>> callApiWithErrorParser<T>(
      Future<Response<T>> Function() dioCall) async {

    try {
      Response<T> response = await dioCall.call();

      return response;
    } on DioError catch (dioError, stackTrace) {
      Exception exception = handleDioError(dioError);
      Log.error(
          "Throwing error from repository: >>>>>>> $exception : ${(exception as BaseException).message}");
      throw exception;
    } catch (error) {
      Log.error("Generic error: >>>>>>> $error");

      if (error is BaseException) {
        rethrow;
      } else if (error is NetworkException) {
        rethrow;
      }

      throw handleError("$error");
    }
  }
}
