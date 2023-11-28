import 'package:fifa_world_cup_app/app/core/mvp/fwc_presenter.dart';
import 'package:fifa_world_cup_app/app/pages/auth/login/view/i_login_view.dart';
import 'package:fifa_world_cup_app/app/pages/auth/login/view/login_view.dart';

abstract class ILoginPresenter extends FwcPresenter<ILoginView> {

  Future<void> login({
    required String email,
    required String password,
  });
}