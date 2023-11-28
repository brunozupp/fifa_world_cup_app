import 'package:fifa_world_cup_app/app/core/ui/global/i_global_context.dart';
import 'package:fifa_world_cup_app/app/core/ui/styles/colors_app.dart';
import 'package:fifa_world_cup_app/app/repositories/auth/i_auth_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class GlobalContext implements IGlobalContext {

  final GlobalKey<NavigatorState> _navigatorKey;
  final IAuthRepository _authRepository;

  GlobalContext({
    required GlobalKey<NavigatorState> navigatorKey,
    required IAuthRepository authRepository,
  })  : _navigatorKey = navigatorKey,
        _authRepository = authRepository;
  
  @override
  Future<void> loginExpire() async {
    
    final sp = await SharedPreferences.getInstance();

    sp.clear();

    showTopSnackBar(
      // ignore: use_build_context_synchronously
      Overlay.of(_navigatorKey.currentState!.context), 
      CustomSnackBar.error(
        message: "Login Expirado",
        backgroundColor: ColorsApp.i.primary,
      ),
    );

    _navigatorKey.currentState!.pushNamedAndRemoveUntil("/auth/login", (route) => false);
  }
  
}