import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fifa_world_cup_app/app/core/exceptions/repository_exception.dart';
import 'package:fifa_world_cup_app/app/core/rest/custom_dio.dart';
import 'package:fifa_world_cup_app/app/models/groups_stickers.dart';
import 'package:fifa_world_cup_app/app/models/register_sticker_model.dart';
import 'package:fifa_world_cup_app/app/models/sticker_model.dart';
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

  @override
  Future<StickerModel?> findStickerByCode(String stickerCode, String stickerNumber) async {
    
    try {
      final result = await _dio.get("/api/sticker-search", data: {
        "sticker_code": stickerCode,
        "sticker_number": stickerNumber,
      });

      return StickerModel.fromMap(result.data);
    } on DioException catch (e, s) {

      // Esse status seria uma resposta normal do meu sistema, por isso não retorno uma exceção
      if(e.response?.statusCode == 404) {
        return null;
      }

      const errorMessage = "Figurinha não foi encontrada";

      log(errorMessage, error: e, stackTrace: s);

      throw RepositoryException(message: errorMessage);
    }
  }

  @override
  Future<StickerModel> create(RegisterStickerModel registerStickerModel) async {
    
    try {
      final body = FormData.fromMap({
        ...registerStickerModel.toMap(),
        "sticker_image_upload": "",
      });

      final result = await _dio.auth().post("/api/sticker", data: body);

      return StickerModel.fromMap(result.data);
    } on DioException catch (e, s) {

      const errorMessage = "Erro ao registrar figurinha no álbum";

      log(errorMessage, error: e, stackTrace: s);
      
      throw RepositoryException(message: errorMessage);
    }
  }
  
}