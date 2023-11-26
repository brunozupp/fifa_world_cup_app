import 'package:fifa_world_cup_app/app/pages/splash/presenter/i_splash_presenter.dart';
import 'package:fifa_world_cup_app/app/pages/splash/view/splash_view.dart';

class SplashPresenter implements ISplashPresenter {

  late final SplashView _view;

  @override
  Future<void> checkLogin() async {
    _view.showLoader();

    // Faz alguma coisa

    _view.logged(true);
  }

  @override
  set view(view) {
    _view = view;
  }
  
}