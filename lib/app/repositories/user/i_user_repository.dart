import 'package:fifa_world_cup_app/app/models/user_model.dart';

abstract class IUserRepository {

  Future<UserModel> getMe();
}