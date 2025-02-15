// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chopper_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$ChopperApiService extends ChopperApiService {
  _$ChopperApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ChopperApiService;

  @override
  Future<Response<dynamic>> get() {
    final $url = '/posts/1';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getError() {
    final $url = '/error';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getWithParams() {
    final $url = '/posts?userId=1';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> post(dynamic body) {
    final $url = '/posts';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> put(Map<String, dynamic> body) {
    final $url = '/posts/1';
    final $body = body;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> delete() {
    final $url = '/posts/1';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> patch(Map<String, dynamic> body) {
    final $url = '/posts/1';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }
}
