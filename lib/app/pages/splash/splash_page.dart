import 'package:flutter/material.dart';

import 'package:fifa_world_cup_app/app/core/ui/styles/button_styles.dart';
import 'package:fifa_world_cup_app/app/core/ui/styles/colors_app.dart';
import 'package:fifa_world_cup_app/app/core/ui/styles/text_app_styles.dart';
import 'package:fifa_world_cup_app/app/core/ui/widgets/app_button.dart';
import 'package:fifa_world_cup_app/app/pages/splash/presenter/i_splash_presenter.dart';
import 'package:fifa_world_cup_app/app/pages/splash/view/splash_view.dart';

class SplashPage extends StatefulWidget {

  final ISplashPresenter presenter;

  const SplashPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends SplashView {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: context.colors.primary,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_splash.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.08,
                ),
                child: Image.asset(
                  "assets/images/fifa_logo.png",
                  height: size.height * 0.25,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: size.height * 0.19,
                ),
                child: AppButton(
                  onPressed: () {
                    widget.presenter.checkLogin();
                  },
                  width: size.width * 0.9,
                  style: context.buttonStyles.yellowButton, 
                  labelStyle: context.textStyles.textSecondaryFontExtraBoldPrimaryColor, 
                  label: "Acessar",
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: Image.asset(
                  "assets/images/bandeiras.png",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
