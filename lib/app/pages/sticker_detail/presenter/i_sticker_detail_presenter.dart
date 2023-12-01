import 'package:fifa_world_cup_app/app/core/mvp/fwc_presenter.dart';
import 'package:fifa_world_cup_app/app/models/user_sticker_model.dart';
import 'package:fifa_world_cup_app/app/pages/sticker_detail/view/i_sticker_detail_view.dart';

// Os métodos no Presenter sempre são VOID pq eles NÃO PODEM retornar nada
abstract class IStickerDetailPresenter extends FwcPresenter<IStickerDetailView> {

  Future<void> load({
    required String countryCode,
    required String stickerNumber,
    required String countryName,
    UserStickerModel? stickerUser,
  });

  void incrementAmount();

  void decrementAmount();

  Future<void> saveSticker();

  Future<void> deleteSticker();
}