import 'package:fifa_world_cup_app/app/models/sticker_model.dart';

abstract class IFindStickerService {

  Future<StickerModel> execute(String countryCode, String stickerNumber);
}