import 'package:fifa_world_cup_app/app/models/register_sticker_model.dart';
import 'package:fifa_world_cup_app/app/models/sticker_model.dart';
import 'package:fifa_world_cup_app/app/repositories/stickers/i_stickers_repository.dart';
import 'package:fifa_world_cup_app/app/services/sticker/i_find_sticker_service.dart';

class FindStickerService implements IFindStickerService {

  final IStickersRepository _stickersRepository;

  FindStickerService({
    required IStickersRepository stickersRepository,
  }) : _stickersRepository = stickersRepository;

  @override
  Future<StickerModel> execute(String countryCode, String stickerNumber) async {
    
    var sticker = await _stickersRepository.findStickerByCode(countryCode, stickerNumber);

    if(sticker == null) {
      final registerSticker = RegisterStickerModel(
        name: "",
        stickerCode: countryCode,
        stickerNumber: stickerNumber,
      );

      sticker = await _stickersRepository.create(registerSticker);
    }

    return sticker; 
  }
  
}