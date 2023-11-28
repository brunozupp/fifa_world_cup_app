import 'package:fifa_world_cup_app/app/pages/my_stickers/presenter/i_my_stickers_presenter.dart';
import 'package:fifa_world_cup_app/app/pages/my_stickers/view/i_my_stickers_view.dart';

class MyStickersPresenter extends IMyStickersPresenter {
  
  late final IMyStickersView _view;
  
  @override
  set view(IMyStickersView view) {
    _view = view;
  }
  
}