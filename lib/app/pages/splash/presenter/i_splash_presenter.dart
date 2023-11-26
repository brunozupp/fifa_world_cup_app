import 'package:fifa_world_cup_app/app/core/mvp/fwc_presenter.dart';

abstract class ISplashPresenter extends FwcPresenter {

  Future<void> checkLogin();
}