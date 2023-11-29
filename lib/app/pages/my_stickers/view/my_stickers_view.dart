import 'package:fifa_world_cup_app/app/core/ui/helpers/app_loader.dart';
import 'package:fifa_world_cup_app/app/core/ui/helpers/app_messages.dart';
import 'package:fifa_world_cup_app/app/models/groups_stickers.dart';
import 'package:fifa_world_cup_app/app/pages/my_stickers/my_stickers_page.dart';
import 'package:fifa_world_cup_app/app/pages/my_stickers/view/i_my_stickers_view.dart';
import 'package:flutter/widgets.dart';

abstract class MyStickersView extends State<MyStickersPage> with AppLoader, AppMessages implements IMyStickersView {

  List<GroupsStickers> album = [];

  @override
  void initState() {
    widget.presenter.view = this;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { 
      widget.presenter.getMyAlbum();
    });

    super.initState();
  }

  @override
  void loadPage(List<GroupsStickers> album) {
    setState(() {
      this.album = album;
    });
  }

  @override
  void error(String message) {
    hideLoader();
    showError(message);
  }
}