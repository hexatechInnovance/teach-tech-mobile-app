import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:teach_tech_mobile/app/data/local/preference/preference_manager.dart';

class RequestHeaderInterceptor extends InterceptorsWrapper {
  final PreferenceManager _preferenceManager =
      Get.find(tag: (PreferenceManager).toString());

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    getCustomHeaders().then((customHeaders) {
      options.headers.addAll(customHeaders);
      super.onRequest(options, handler);
    });
  }

  Future<Map<String, String>> getCustomHeaders() async {
    final accessToken =
        _preferenceManager.getString(PreferenceManager.accessToken);
    var customHeaders = {'content-type': 'application/json'};
    if (accessToken.isNotEmpty) {
      customHeaders.addAll({'Authorization': 'Bearer $accessToken'});
    }
    return customHeaders;
  }
}
