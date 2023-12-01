// import 'package:dio/dio.dart';
//
// import '../../constant/api_constants.dart';
// import '../../router/routes.dart';
// import '../../util/logger.dart';
// import '../../util/storage.dart';
// import '../api_service.dart';
//
// class ApiInterceptor implements Interceptor {
//   const ApiInterceptor();
//
//   @override
//   Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
//     info('''
// ----------------------------------------------------------
//   *** ON_REQUEST(${options.method}) ***
//       URL: ${options.uri}
//       Data: ${options.data}
//       QueryParameters: ${options.queryParameters}
//       Headers: ${options.headers}
// ----------------------------------------------------------
// ''');
//
//     return handler.next(options);
//   }
//
//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     info('''
// ----------------------------------------------------------
//   *** ON_RESPONSE(${response.statusCode}) ***
//       URL: ${response.realUri}
//       Data: ${response.data}
// ----------------------------------------------------------
// ''');
//
//     return handler.next(response);
//   }
//
//   @override
//   Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
//     info('''
// ----------------------------------------------------------
//   *** ON_ERROR ***
//       URL: ${err.response?.realUri}
//       Message: ${err.message}
// ----------------------------------------------------------
// ''');
//
//     if (err.response?.statusCode == 401) {
//       final responseRefresh = await ApiService.dio.request<Map<String, Object?>>(
//         ApiConst.refreshTokenPath,
//         data: {
//           'accessToken': await StorageService.getSecureValue(StorageKeys.accessToken),
//           'refreshToken': await StorageService.getSecureValue(StorageKeys.refreshToken),
//         },
//         // options: Options(
//         //   method: Method.put.name,
//         // ),
//       );
//
//       warning(responseRefresh.data ?? <String, Object?>{});
//
//       if (responseRefresh.statusCode == 401 || responseRefresh.data == null) {
//         info('Log Out - Client');
//
//       } else {
//         final accessToken = (responseRefresh.data!['accessToken'] as String?)!;
//         final refreshToken = (responseRefresh.data!['refreshToken'] as String?)!;
//
//         await StorageService.setSecureValue(StorageKeys.accessToken, accessToken);
//         await StorageService.setSecureValue(StorageKeys.refreshToken, refreshToken);
//
//         return handler.resolve(await _retry<dynamic>(err.requestOptions));
//       }
//     }
//
//     return handler.next(err);
//   }
//
//   static Future<Response<T>> _retry<T>(RequestOptions requestOptions) async => ApiService.dio.request<T>(
//         requestOptions.path,
//         data: requestOptions.data,
//         queryParameters: requestOptions.queryParameters,
//         options: Options(
//           method: requestOptions.method,
//           headers: requestOptions.headers
//             ..addAll(
//               <String, String>{
//                 'Authorization': await StorageService.getSecureValue(StorageKeys.accessToken) ?? '',
//               },
//             ),
//         ),
//       );
// }
