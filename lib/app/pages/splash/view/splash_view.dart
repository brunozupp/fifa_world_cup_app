import 'package:fifa_world_cup_app/app/core/ui/helpers/app_loader.dart';
import 'package:fifa_world_cup_app/app/pages/splash/splash_page.dart';
import 'package:fifa_world_cup_app/app/pages/splash/view/i_splash_view.dart';
import 'package:flutter/widgets.dart';

abstract class SplashView extends State<SplashPage> with AppLoader<SplashPage> implements ISplashView {

  @override
  void initState() {
    widget.presenter.view = this;
    super.initState();
  }

  @override
  void logged(bool isLogged) {
    hideLoader();

    if(isLogged) {
      Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false);
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil("/auth/login", (route) => false);
    }
  }
  
}