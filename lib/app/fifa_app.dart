import 'package:fifa_world_cup_app/app/core/ui/theme/theme_config.dart';
import 'package:fifa_world_cup_app/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

class FifaApp extends StatelessWidget {

  const FifaApp({ super.key });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fifla World Cup Album",
      theme: ThemeConfig.theme,
      routes: {
        "/": (_) => const SplashPage(),
      },
    );
  }
}