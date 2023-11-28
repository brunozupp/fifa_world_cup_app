import 'package:fifa_world_cup_app/app/repositories/auth/i_auth_repository.dart';
import 'package:fifa_world_cup_app/app/services/login/i_login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService implements ILoginService {

  final IAuthRepository _authRepository;

  LoginService({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<void> execute({
    required String email,
    required String password,
  }) async {
    
    final accessToken = await _authRepository.login(
      email: email,
      password: password,
    );

    final sp = await SharedPreferences.getInstance();

    sp.setString("accessToken", accessToken);
  }
  
}