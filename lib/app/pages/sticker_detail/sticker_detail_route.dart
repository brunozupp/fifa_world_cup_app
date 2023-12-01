import 'package:fifa_world_cup_app/app/pages/sticker_detail/presenter/i_sticker_detail_presenter.dart';
import 'package:fifa_world_cup_app/app/pages/sticker_detail/presenter/sticker_detail_presenter.dart';
import 'package:fifa_world_cup_app/app/pages/sticker_detail/sticker_detail_page.dart';
import 'package:fifa_world_cup_app/app/repositories/stickers/i_stickers_repository.dart';
import 'package:fifa_world_cup_app/app/repositories/stickers/stickers_repository.dart';
import 'package:fifa_world_cup_app/app/services/sticker/find_sticker_service.dart';
import 'package:fifa_world_cup_app/app/services/sticker/i_find_sticker_service.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';

class StickerDetailRoute extends FlutterGetItPageRoute {
  
  const StickerDetailRoute({super.key});
  
  @override
  List<Bind<Object>> get bindings => [
    Bind.lazySingleton<IStickersRepository>((i) => StickersRepository(dio: i())),
    Bind.lazySingleton<IFindStickerService>((i) => FindStickerService(stickersRepository: i())),
    Bind.lazySingleton<IStickerDetailPresenter>(
      (i) => StickerDetailPresenter(
        findStickerService: i(),
        stickersRepository: i(),
      ),
    ),
  ];
  
  @override
  WidgetBuilder get page => (context) => StickerDetailPage(
    presenter: context.get(),
  );
  
}