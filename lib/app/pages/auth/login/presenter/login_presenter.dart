import 'dart:developer';

import 'package:fifa_world_cup_app/app/core/exceptions/unauthorized_exception.dart';
import 'package:fifa_world_cup_app/app/pages/auth/login/presenter/i_login_presenter.dart';
import 'package:fifa_world_cup_app/app/pages/auth/login/view/i_login_view.dart';
import 'package:fifa_world_cup_app/app/services/login/i_login_service.dart';

class LoginPresenter implements ILoginPresenter {

  final ILoginService _loginService;

  LoginPresenter({
    required ILoginService loginService,
  }) : _loginService = loginService;
  
  late final ILoginView _view;

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {

    try {
      await _loginService.execute(
        email: email,
        password: password,
      );

      _view.success();
    } on UnauthorizedException {
      _view.error("Usuário e/ou senha inválidos");
    } catch(e, s) {

      const errorMessage = "Erro ao realizar o login";

      log(errorMessage, error: e, stackTrace: s);

      _view.error(errorMessage);
    }
  }

  @override
  set view(ILoginView view) {
    _view = view;
  }
}