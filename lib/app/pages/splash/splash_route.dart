import 'package:fifa_world_cup_app/app/pages/splash/presenter/i_splash_presenter.dart';
import 'package:fifa_world_cup_app/app/pages/splash/presenter/splash_presenter.dart';
import 'package:fifa_world_cup_app/app/pages/splash/splash_page.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';

class SplashRoute extends FlutterGetItPageRoute {
  
  const SplashRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
    Bind.lazySingleton<ISplashPresenter>((i) => SplashPresenter()),
  ];

  @override
  WidgetBuilder get page => (context) => SplashPage(presenter: context.get());
  
}