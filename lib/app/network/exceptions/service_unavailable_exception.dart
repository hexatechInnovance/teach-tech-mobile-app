import 'dart:io';
import 'package:teach_tech_mobile/app/network/exceptions/base_api_exception.dart';

class ServiceUnavailableException extends BaseApiException {
  ServiceUnavailableException(String message)
      : super(
          httpCode: HttpStatus.serviceUnavailable,
          message: message,
          status: "",
        );
}
