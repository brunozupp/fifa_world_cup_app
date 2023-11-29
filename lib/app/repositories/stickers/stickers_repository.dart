import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fifa_world_cup_app/app/core/exceptions/repository_exception.dart';
import 'package:fifa_world_cup_app/app/core/rest/custom_dio.dart';
import 'package:fifa_world_cup_app/app/models/groups_stickers.dart';
import 'package:fifa_world_cup_app/app/repositories/stickers/i_stickers_repository.dart';

class StickersRepository implements IStickersRepository {
  
  final CustomDio _dio;

  StickersRepository({
    required CustomDio dio,
  }) : _dio = dio;
  
  @override
  Future<List<GroupsStickers>> getMyAlbum() async {
    
    try {
      final result = await _dio.auth().get(
        "/api/countries",
      );

      final countriesList = result.data as List;

      return countriesList
          .map<GroupsStickers>((e) => GroupsStickers.fromMap(e))
          .toList();
    } on DioException catch (e,s) {
      
      const errorMessage = "Erro ao buscar álbum do usuário";

      log(errorMessage, error: e, stackTrace: s);

      throw RepositoryException(message: errorMessage);
    }
  }
  
}