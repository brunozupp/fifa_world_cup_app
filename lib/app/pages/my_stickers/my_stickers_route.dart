import 'package:fifa_world_cup_app/app/pages/my_stickers/my_stickers_page.dart';
import 'package:fifa_world_cup_app/app/pages/my_stickers/presenter/i_my_stickers_presenter.dart';
import 'package:fifa_world_cup_app/app/pages/my_stickers/presenter/my_stickers_presenter.dart';
import 'package:fifa_world_cup_app/app/repositories/stickers/i_stickers_repository.dart';
import 'package:fifa_world_cup_app/app/repositories/stickers/stickers_repository.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';

class MyStickersRoute extends FlutterGetItPageRoute {

  const MyStickersRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
    Bind.lazySingleton<IStickersRepository>((i) => StickersRepository(dio: i())),
    Bind.lazySingleton<IMyStickersPresenter>((i) => MyStickersPresenter(stickersRepository: i())),
  ];
  
  @override
  WidgetBuilder get page => (context) => MyStickersPage(
    presenter: context.get(),
  );
  
}