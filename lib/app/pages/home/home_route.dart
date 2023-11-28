import 'package:fifa_world_cup_app/app/pages/home/home_page.dart';
import 'package:fifa_world_cup_app/app/pages/home/presenter/home_presenter.dart';
import 'package:fifa_world_cup_app/app/pages/home/presenter/i_home_presenter.dart';
import 'package:fifa_world_cup_app/app/repositories/user/i_user_repository.dart';
import 'package:fifa_world_cup_app/app/repositories/user/user_repository.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';

class HomeRoute extends FlutterGetItPageRoute {

  const HomeRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
    Bind.lazySingleton<IUserRepository>((i) => UserRepository(dio: i())),
    Bind.lazySingleton<IHomePresenter>((i) => HomePresenter(userRepository: i())),
  ];

  @override
  WidgetBuilder get page => (context) => HomePage(
    presenter: context.get(),
  );
  
}