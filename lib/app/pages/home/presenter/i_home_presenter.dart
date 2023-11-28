import 'package:fifa_world_cup_app/app/core/mvp/fwc_presenter.dart';
import 'package:fifa_world_cup_app/app/pages/home/view/i_home_view.dart';

abstract class IHomePresenter extends FwcPresenter<IHomeView> {

  Future<void> getUserData();

  Future<void> logout();
}