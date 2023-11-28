import 'package:fifa_world_cup_app/app/core/ui/helpers/app_loader.dart';
import 'package:fifa_world_cup_app/app/core/ui/helpers/app_messages.dart';
import 'package:fifa_world_cup_app/app/models/user_model.dart';
import 'package:fifa_world_cup_app/app/pages/home/home_page.dart';
import 'package:fifa_world_cup_app/app/pages/home/view/i_home_view.dart';
import 'package:flutter/widgets.dart';

abstract class HomeView extends State<HomePage> with AppLoader, AppMessages implements IHomeView {

  UserModel? user;

  @override
  void initState() {
    widget.presenter.view = this;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { 
      widget.presenter.getUserData();
    });

    super.initState();
  }

  @override
  void error(String message) {
    hideLoader();
    showError(message);
  }

  @override
  void logoutSuccess() {
    hideLoader();
    Navigator.of(context).pushNamedAndRemoveUntil("/auth/login", (route) => false);
  }

  @override
  void showLoader() {
    showLoader();
  }

  @override
  void updateUser(UserModel user) {
    hideLoader();
    setState(() {
      this.user = user;
    });
  }

}