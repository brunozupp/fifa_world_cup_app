import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fifa_world_cup_app/app/core/exceptions/repository_exception.dart';
import 'package:fifa_world_cup_app/app/core/rest/custom_dio.dart';
import 'package:fifa_world_cup_app/app/models/user_model.dart';
import 'package:fifa_world_cup_app/app/repositories/user/i_user_repository.dart';

class UserRepository implements IUserRepository {

  final CustomDio _dio;

  UserRepository({
    required CustomDio dio,
  }) : _dio = dio;

  @override
  Future<UserModel> getMe() async {
    
    try {
      final result = await _dio.auth().get("/api/me");

      return UserModel.fromMap(result.data);
    } on DioException catch (e, s) {

      const errorMessage = "Erro ao buscar os dados do usuário";

      log(errorMessage, error: e, stackTrace: s);

      throw RepositoryException(message: errorMessage);
    }
  }
  
}