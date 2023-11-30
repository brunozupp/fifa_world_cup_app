import 'package:fifa_world_cup_app/app/models/groups_stickers.dart';
import 'package:fifa_world_cup_app/app/pages/my_stickers/presenter/i_my_stickers_presenter.dart';
import 'package:fifa_world_cup_app/app/pages/my_stickers/view/i_my_stickers_view.dart';
import 'package:fifa_world_cup_app/app/repositories/stickers/i_stickers_repository.dart';

class MyStickersPresenter implements IMyStickersPresenter {

  final IStickersRepository _stickersRepository;

  MyStickersPresenter({
    required IStickersRepository stickersRepository,
  }) : _stickersRepository = stickersRepository;
  
  late final IMyStickersView _view;

  List<GroupsStickers> album = [];
  
  var statusSelected = "all";
  
  @override
  set view(IMyStickersView view) {
    _view = view;
  }
  
  @override
  Future<void> getMyAlbum() async {
    try {

      album = await _stickersRepository.getMyAlbum();
      
      _view.loadPage([...album]); 
    } catch (e) {
      _view.error("Erro ao carregar os dados");
    }
  }
  
  @override
  Future<void> statusFilter(String status) async {
    statusSelected = status;
    _view.updateStatusFilter(status);
  }
  
}