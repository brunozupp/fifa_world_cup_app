import 'package:fifa_world_cup_app/app/pages/my_stickers/my_stickers_page.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';

class MyStickersRoute extends FlutterGetItPageRoute {

  const MyStickersRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [];
  
  @override
  WidgetBuilder get page => (context) => MyStickersPage(
    presenter: context.get(),
  );
  
}