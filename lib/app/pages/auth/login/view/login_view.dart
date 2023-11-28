import 'package:fifa_world_cup_app/app/core/ui/helpers/app_loader.dart';
import 'package:fifa_world_cup_app/app/core/ui/helpers/app_messages.dart';
import 'package:fifa_world_cup_app/app/pages/auth/login/login_page.dart';
import 'package:fifa_world_cup_app/app/pages/auth/login/view/i_login_view.dart';
import 'package:flutter/widgets.dart';

abstract class LoginView extends State<LoginPage> with AppLoader, AppMessages implements ILoginView {
  
  @override
  void initState() {
    widget.presenter.view = this;
    super.initState();
  }

  @override
  void error(String message) {
    hideLoader();
    showError(message);
  }

  @override
  void success() {
    hideLoader();
    Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
  }
  
}