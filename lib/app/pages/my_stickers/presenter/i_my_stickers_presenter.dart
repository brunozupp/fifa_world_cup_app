import 'package:fifa_world_cup_app/app/core/mvp/fwc_presenter.dart';
import 'package:fifa_world_cup_app/app/pages/my_stickers/view/i_my_stickers_view.dart';

abstract class IMyStickersPresenter implements FwcPresenter<IMyStickersView> {

  Future<void> getMyAlbum();

  Future<void> statusFilter(String status);
}