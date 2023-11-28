import 'package:fifa_world_cup_app/app/pages/auth/login/login_page.dart';
import 'package:fifa_world_cup_app/app/pages/auth/login/presenter/i_login_presenter.dart';
import 'package:fifa_world_cup_app/app/pages/auth/login/presenter/login_presenter.dart';
import 'package:fifa_world_cup_app/app/services/login/i_login_service.dart';
import 'package:fifa_world_cup_app/app/services/login/login_service.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';

class LoginRoute extends FlutterGetItPageRoute {
  
  const LoginRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
    Bind.lazySingleton<ILoginService>((i) => LoginService(authRepository: i())),
    Bind.lazySingleton<ILoginPresenter>((i) => LoginPresenter(loginService: i())),
  ];

  @override
  WidgetBuilder get page => (context) => LoginPage(presenter: context.get());
  
}