import 'package:fifa_world_cup_app/app/models/sticker_model.dart';
import 'package:fifa_world_cup_app/app/models/user_sticker_model.dart';
import 'package:fifa_world_cup_app/app/pages/sticker_detail/presenter/i_sticker_detail_presenter.dart';
import 'package:fifa_world_cup_app/app/pages/sticker_detail/view/i_sticker_detail_view.dart';
import 'package:fifa_world_cup_app/app/services/sticker/i_find_sticker_service.dart';

class StickerDetailPresenter implements IStickerDetailPresenter {

  final IFindStickerService findStickerService;

  StickerDetailPresenter({
    required this.findStickerService,
  });

  late final IStickerDetailView _view;

  UserStickerModel? stickerUser;

  StickerModel? sticker;

  int amount = 0;

  @override
  set view(IStickerDetailView view) {
    _view = view;
  }

  @override
  Future<void> load({
    required String countryCode,
    required String stickerNumber,
    required String countryName,
    UserStickerModel? stickerUser,
  }) async {
    this.stickerUser = stickerUser;

    if(stickerUser == null) {
      sticker = await findStickerService.execute(countryCode, stickerNumber);
    }

    bool hasSticker = stickerUser != null;

    if(hasSticker) {
      amount = stickerUser.duplicate + 1;
    }

    _view.screenLoaded(
      hasSticker: hasSticker,
      countryCode: countryCode,
      stickerNumber: stickerNumber,
      countryName: countryName,
      amount: amount,
    );
  }
  
  @override
  void decrementAmount() {

    if(amount > 1) {
      amount -= 1;
      _view.updateAmount(amount);
    }
  }
  
  @override
  void incrementAmount() {
    amount += 1;
    _view.updateAmount(amount);
  }
  
}