import 'package:fifa_world_cup_app/app/pages/home/presenter/i_home_presenter.dart';
import 'package:fifa_world_cup_app/app/pages/home/view/i_home_view.dart';
import 'package:fifa_world_cup_app/app/repositories/user/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePresenter implements IHomePresenter {

  final UserRepository _userRepository;

  HomePresenter({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  late final IHomeView _view;

  @override
  Future<void> getUserData() async {
    try {
      _view.showLoader();

      final user = await _userRepository.getMe();
      _view.updateUser(user);
    } catch (e) {
      _view.error("Erro ao buscar dados do usuário");
    }
  }

  @override
  Future<void> logout() async {
    _view.showLoader();
    final sp = await SharedPreferences.getInstance();
    sp.clear();
    _view.logoutSuccess();
  }

  @override
  set view(IHomeView view) {
    _view = view;
  }
  
}