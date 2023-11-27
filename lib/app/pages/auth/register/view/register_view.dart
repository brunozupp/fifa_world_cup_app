import 'package:fifa_world_cup_app/app/core/ui/helpers/app_loader.dart';
import 'package:fifa_world_cup_app/app/core/ui/helpers/app_messages.dart';
import 'package:fifa_world_cup_app/app/pages/auth/register/register_page.dart';
import 'package:fifa_world_cup_app/app/pages/auth/register/view/i_register_view.dart';
import 'package:flutter/widgets.dart';

abstract class RegisterView extends State<RegisterPage> with AppMessages, AppLoader implements IRegisterView {
  
  @override
  void initState() {
    widget.presenter.view = this;
    super.initState();
  }

  @override
  void registerError([String? message]) {
    hideLoader();

    showError(message ?? "Erro ao registrar usuário");
  }

  @override
  void registerSuccess() {
    hideLoader();

    showSuccess("Usuário cadastrado com sucesso");

    Navigator.of(context).pop();
  }

}