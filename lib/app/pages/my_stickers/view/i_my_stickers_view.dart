import 'package:fifa_world_cup_app/app/models/groups_stickers.dart';

abstract class IMyStickersView {

  void loadPage(List<GroupsStickers> album);

  void error(String message);
}