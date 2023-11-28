import 'package:fifa_world_cup_app/app/pages/splash/presenter/i_splash_presenter.dart';
import 'package:fifa_world_cup_app/app/pages/splash/view/i_splash_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPresenter implements ISplashPresenter {

  late final ISplashView _view;

  @override
  Future<void> checkLogin() async {
    _view.showLoader();

    final sp = await SharedPreferences.getInstance();

    final accessToken = sp.getString("accessToken");

    _view.logged(accessToken != null);
  }

  @override
  set view(view) {
    _view = view;
  }
  
}