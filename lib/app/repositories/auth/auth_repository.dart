import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fifa_world_cup_app/app/core/exceptions/repository_exception.dart';
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
    throw Exception();
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