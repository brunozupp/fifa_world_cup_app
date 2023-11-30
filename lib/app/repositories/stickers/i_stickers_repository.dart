import 'package:fifa_world_cup_app/app/models/groups_stickers.dart';
import 'package:fifa_world_cup_app/app/models/register_sticker_model.dart';
import 'package:fifa_world_cup_app/app/models/sticker_model.dart';

abstract class IStickersRepository {

  Future<List<GroupsStickers>> getMyAlbum();

  Future<StickerModel?> findStickerByCode(String stickerCode, String stickerNumber);

  Future<StickerModel> create(RegisterStickerModel registerStickerModel);
}