import 'dart:convert';

import 'package:chucker_flutter_ui/chucker_flutter_ui.dart';
import 'package:dio/dio.dart';

///[ChuckerDioInterceptor] adds support for `chucker_flutter` in [Dio] library.
class ChuckerDioInterceptor extends Interceptor {
  late DateTime _requestTime;
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    _requestTime = DateTime.now();
    handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    ChuckerUiHelper.showNotification(
      method: response.requestOptions.method,
      statusCode: response.statusCode ?? -1,
      path: response.requestOptions.path,
    );
    await _saveResponse(response);
    handler.next(response);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    ChuckerUiHelper.showNotification(
      method: err.requestOptions.method,
      statusCode: err.response?.statusCode ?? -1,
      path: err.requestOptions.path,
    );
    await _saveError(err);
    handler.next(err);
  }

  Future<void> _saveResponse(Response response) async {
    await SharedPreferencesManager.getInstance().addApiResponse(
      ApiResponse(
        body: {'data': response.data},
        path: response.requestOptions.path,
        baseUrl: response.requestOptions.baseUrl,
        method: response.requestOptions.method,
        statusCode: response.statusCode ?? -1,
        connectionTimeout: response.requestOptions.connectTimeout,
        contentType: response.requestOptions.contentType,
        headers: response.requestOptions.headers.toString(),
        queryParameters: response.requestOptions.queryParameters.toString(),
        receiveTimeout: response.requestOptions.receiveTimeout,
        request: {'request': response.requestOptions.data},
        requestSize: 2,
        requestTime: _requestTime,
        responseSize: 2,
        responseTime: DateTime.now(),
        responseType: response.requestOptions.responseType.name,
        sendTimeout: response.requestOptions.sendTimeout,
        checked: false,
        clientLibrary: 'Dio',
      ),
    );
  }

  Future<void> _saveError(DioError response) async {
    await SharedPreferencesManager.getInstance().addApiResponse(
      ApiResponse(
        body: {'data': jsonDecode(response.response.toString())},
        path: response.requestOptions.path,
        baseUrl: response.requestOptions.baseUrl,
        method: response.requestOptions.method,
        statusCode: response.response?.statusCode ?? -1,
        connectionTimeout: response.requestOptions.connectTimeout,
        contentType: response.requestOptions.contentType,
        headers: response.requestOptions.headers.toString(),
        queryParameters: response.requestOptions.queryParameters.toString(),
        receiveTimeout: response.requestOptions.receiveTimeout,
        request: {'request': response.requestOptions.data},
        requestSize: 2,
        requestTime: _requestTime,
        responseSize: 2,
        responseTime: DateTime.now(),
        responseType: response.requestOptions.responseType.name,
        sendTimeout: response.requestOptions.sendTimeout,
        checked: false,
        clientLibrary: 'Dio',
      ),
    );
  }
}
