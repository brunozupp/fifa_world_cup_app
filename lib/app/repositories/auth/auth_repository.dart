import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fifa_world_cup_app/app/core/exceptions/repository_exception.dart';
import 'package:fifa_world_cup_app/app/core/exceptions/unauthorized_exception.dart';
import 'package:fifa_world_cup_app/app/core/rest/custom_dio.dart';
import 'package:fifa_world_cup_app/app/models/register_user_model.dart';
import 'package:fifa_world_cup_app/app/repositories/auth/i_auth_repository.dart';

class AuthRepository implements IAuthRepository {

  final CustomDio _dio;

  AuthRepository({
    required CustomDio dio,
  }) : _dio = dio;

  @override
  Future<String> login({
    required String email,
    required String password,
  }) async {
    
    try {
      final result = await _dio.post("/api/auth", data: {
        "email": email,
        "password": password,
      });

      final accessToken = result.data["access_token"];

      if (accessToken == null) {
        throw UnauthorizedException();
      }

      return accessToken;
    } on DioException catch (e,s) {

      const errorMessage = "Erro ao realizar login";
      
      log(errorMessage, error: e, stackTrace: s);

      if(e.response?.statusCode == 401) {
        throw UnauthorizedException();
      }

      throw RepositoryException(message: errorMessage);

    } on UnauthorizedException {
      rethrow;
    } on RepositoryException {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    
  }

  @override
  Future<void> register(RegisterUserModel registerModel) async {
    
    try {
      await _dio.unauth().post(
        "/api/register",
        data: registerModel.toMap(),
      );
    } on DioException catch (e,s) {

      const errorMessage = "Erro ao registrar usuário";

      log(errorMessage, error: e, stackTrace: s);

      throw RepositoryException(message: errorMessage);
    }
  }
  
}