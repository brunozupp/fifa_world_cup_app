import 'package:fifa_world_cup_app/app/core/ui/styles/button_styles.dart';
import 'package:fifa_world_cup_app/app/core/ui/styles/colors_app.dart';
import 'package:fifa_world_cup_app/app/core/ui/styles/text_app_styles.dart';
import 'package:fifa_world_cup_app/app/core/ui/widgets/app_button.dart';
import 'package:fifa_world_cup_app/app/pages/home/widgets/status_tile.dart';
import 'package:fifa_world_cup_app/app/pages/home/widgets/sticker_percent_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBar(
        backgroundColor: context.colors.primary,
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/background.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          bottom: 35,
                        ),
                        width: size.width,
                        child: Image.asset(
                          "assets/images/bola.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      StickerPercentWidget(
                        percent: 45,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "45 figurinhas",
                        style: context.textStyles.titleWhite,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      StatusTile(
                        icon: Image.asset("assets/images/all_icon.png"),
                        label: "Todas",
                        value: 45,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      StatusTile(
                        icon: Image.asset("assets/images/missing_icon.png"),
                        label: "Faltando",
                        value: 500,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      StatusTile(
                        icon: Image.asset("assets/images/repeated_icon.png"),
                        label: "Repetidas",
                        value: 30,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppButton(
                        onPressed: () {},
                        width: size.width * 0.9,
                        style: context.buttonStyles.yellowOutlineButton, 
                        labelStyle: context.textStyles.textSecondaryFontExtraBold.copyWith(
                          color: context.colors.yellow,
                        ), 
                        label: "Minhas Figurinhas"
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
