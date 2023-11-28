import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:fifa_world_cup_app/app/core/config/env/env.dart';
import 'package:fifa_world_cup_app/app/core/rest/interceptors/auth_interceptor.dart';

class CustomDio extends DioForNative {

  final _authInterceptor = AuthInterceptor();
  
  CustomDio() : super(BaseOptions(
    baseUrl: Env.i["backend_base_url"] ?? "",
    connectTimeout: const Duration(milliseconds: 5000),
    receiveTimeout: const Duration(milliseconds: 60000),
  )) {
    interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
  }

  CustomDio auth() {
    interceptors.add(_authInterceptor);
    return this;
  }

  CustomDio unauth() {
    interceptors.remove(_authInterceptor);
    return this;
  }
}