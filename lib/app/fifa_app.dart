import 'package:fifa_world_cup_app/app/core/rest/custom_dio.dart';
import 'package:fifa_world_cup_app/app/core/ui/theme/theme_config.dart';
import 'package:fifa_world_cup_app/app/pages/auth/login/login_page.dart';
import 'package:fifa_world_cup_app/app/pages/home/home_page.dart';
import 'package:fifa_world_cup_app/app/pages/splash/splash_page.dart';
import 'package:fifa_world_cup_app/app/pages/splash/splash_route.dart';
import 'package:fifa_world_cup_app/app/repositories/auth/auth_repository.dart';
import 'package:fifa_world_cup_app/app/repositories/auth/i_auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class FifaApp extends StatelessWidget {

  const FifaApp({ super.key });

  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
      bindingsBuilder: () => [
        Bind.lazySingleton<CustomDio>((i) => CustomDio()),
        Bind.lazySingleton<IAuthRepository>((i) => AuthRepository(dio: i())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Fifla World Cup Album",
        theme: ThemeConfig.theme,
        routes: {
          "/": (_) => const SplashRoute(),
          "/auth/login": (_) => const LoginPage(),
          "/home": (_) => const HomePage(),
        },
      ),
    );
  }
}