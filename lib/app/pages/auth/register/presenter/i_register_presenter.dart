import 'package:fifa_world_cup_app/app/core/mvp/fwc_presenter.dart';
import 'package:fifa_world_cup_app/app/pages/auth/register/view/i_register_view.dart';

abstract class IRegisterPresenter extends FwcPresenter<IRegisterView> {

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  });
}