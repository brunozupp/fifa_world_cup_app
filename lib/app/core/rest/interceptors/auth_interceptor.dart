import 'package:dio/dio.dart';
import 'package:fifa_world_cup_app/app/core/ui/global/i_global_context.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    
    final sp = await SharedPreferences.getInstance();

    final accessToken = sp.getString("accessToken");

    options.headers["Authorization"] = "Bearer $accessToken";

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    
    if(err.response?.statusCode == 401) { // Token expirado
      Injector.get<IGlobalContext>().loginExpire();
    } else {
      handler.next(err);
    }
  }
}