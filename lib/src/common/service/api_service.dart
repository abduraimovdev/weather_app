import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../constant/constants.dart';
import '../router/routes.dart';

import '../util/exception_util.dart';

enum Method { get, post, put, patch, delete }

/// ApiService Singleton class
class ApiService {
  static const ApiService _internalSingleton = ApiService._internal();

  factory ApiService() => _internalSingleton;

  const ApiService._internal();

  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: Config.baseUrl,
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json,
    ),
  );


  static Future<bool> hasConnection() async {
    final connection = await Connectivity().checkConnectivity();
    if (connection == ConnectivityResult.mobile ||
        connection == ConnectivityResult.wifi) return true;
    return false;
  }

  static Future<Response<T>> request<T>(
    String path, {
    Method method = Method.get,
    bool setToken = true,
    Map<String, Object?>? data,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
    FormData? formData,
  }) async {
    if (!await hasConnection()) {
      AppRouter.showNetworkNotConnected();
      throw Error.throwWithStackTrace(
        const ExceptionUtilBase.noConnection(),
        StackTrace.current,
      );
    }

    final newHeaders = <String, Object?>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    if (headers != null) newHeaders.addAll(headers);
    Response<T> response = await dio.request<T>(
      Config.baseUrl + path,
      data: data ?? formData,
      queryParameters: queryParams,
      options: Options(
        method: method.name,
        headers: newHeaders,
      ),
    );

    if (response.statusCode == null ||
        response.statusCode! > 204 ||
        response.data == null) {
      debugPrint(
          '${response.statusCode} --- ${response.data} --- ${response.statusMessage}');
      throw Exception(response);
    }

    return response;
  }
}
