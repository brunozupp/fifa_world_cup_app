import 'package:fifa_world_cup_app/app/pages/sticker_detail/sticker_detail_page.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';

class StickerDetailRoute extends FlutterGetItPageRoute {
  
  const StickerDetailRoute({super.key});
  
  @override
  List<Bind<Object>> get bindings => [];
  
  @override
  WidgetBuilder get page => (context) => const StickerDetailPage();
  
}