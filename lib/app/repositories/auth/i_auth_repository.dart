import 'package:fifa_world_cup_app/app/models/register_user_model.dart';

abstract class IAuthRepository {

  Future<void> register(RegisterUserModel registerModel);

  Future<String> login({
    required String email,
    required String password,
  });

  Future<void> logout();
}