import 'package:fifa_world_cup_app/app/pages/auth/register/presenter/i_register_presenter.dart';
import 'package:fifa_world_cup_app/app/pages/auth/register/presenter/register_presenter.dart';
import 'package:fifa_world_cup_app/app/pages/auth/register/register_page.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';

class RegisterRoute extends FlutterGetItPageRoute {
  
  const RegisterRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
    Bind.lazySingleton<IRegisterPresenter>((i) => RegisterPresenter(authRepository: i())),
  ];

  @override
  WidgetBuilder get page => (context) => RegisterPage(presenter: context.get());
}