import 'package:fifa_world_cup_app/app/models/user_model.dart';

abstract class IHomeView {

  void updateUser(UserModel user);

  void error(String message);

  void showLoader();

  void logoutSuccess();
}