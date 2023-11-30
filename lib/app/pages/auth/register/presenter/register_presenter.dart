import 'dart:developer';

import 'package:fifa_world_cup_app/app/models/register_user_model.dart';
import 'package:fifa_world_cup_app/app/pages/auth/register/presenter/i_register_presenter.dart';
import 'package:fifa_world_cup_app/app/pages/auth/register/view/i_register_view.dart';
import 'package:fifa_world_cup_app/app/repositories/auth/i_auth_repository.dart';

class RegisterPresenter implements IRegisterPresenter {

  final IAuthRepository _authRepository;

  RegisterPresenter({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;
  
  late final IRegisterView _view;

  @override
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    
    try {
      final registerModel = RegisterUserModel(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );
      
      await _authRepository.register(registerModel);

      _view.registerSuccess();

    } catch (e, s) {

      const errorMessage = "Erro ao cadastrar usuário";

      log(errorMessage, error: e, stackTrace: s);
      
      _view.registerError(errorMessage);
    }
  }

  @override
  set view(IRegisterView view) {
    _view = view;
  }
  
}