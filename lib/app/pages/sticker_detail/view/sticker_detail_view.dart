import 'package:fifa_world_cup_app/app/core/ui/helpers/app_loader.dart';
import 'package:fifa_world_cup_app/app/core/ui/helpers/app_messages.dart';
import 'package:fifa_world_cup_app/app/pages/sticker_detail/sticker_detail_page.dart';
import 'package:fifa_world_cup_app/app/pages/sticker_detail/view/i_sticker_detail_view.dart';
import 'package:flutter/widgets.dart';

abstract class StickerDetailView extends State<StickerDetailPage> with AppLoader, AppMessages implements IStickerDetailView {
  
}