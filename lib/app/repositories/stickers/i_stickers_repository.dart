import 'package:fifa_world_cup_app/app/models/groups_stickers.dart';

abstract class IStickersRepository {

  Future<List<GroupsStickers>> getMyAlbum();
}