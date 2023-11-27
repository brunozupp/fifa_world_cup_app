import 'package:fifa_world_cup_app/app/core/mvp/fwc_presenter.dart';
import 'package:fifa_world_cup_app/app/pages/splash/view/i_splash_view.dart';

abstract class ISplashPresenter extends FwcPresenter<ISplashView> {

  Future<void> checkLogin();
}