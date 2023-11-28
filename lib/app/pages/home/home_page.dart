import 'package:fifa_world_cup_app/app/core/ui/styles/button_styles.dart';
import 'package:fifa_world_cup_app/app/core/ui/styles/colors_app.dart';
import 'package:fifa_world_cup_app/app/core/ui/styles/text_app_styles.dart';
import 'package:fifa_world_cup_app/app/core/ui/widgets/app_button.dart';
import 'package:fifa_world_cup_app/app/pages/home/presenter/i_home_presenter.dart';
import 'package:fifa_world_cup_app/app/pages/home/view/home_view.dart';
import 'package:fifa_world_cup_app/app/pages/home/widgets/status_tile.dart';
import 'package:fifa_world_cup_app/app/pages/home/widgets/sticker_percent_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  final IHomePresenter presenter;

  const HomePage({
    super.key,
    required this.presenter,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends HomeView {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBar(
        backgroundColor: context.colors.primary,
        actions: [
          IconButton(
            onPressed: () => widget.presenter.logout(), 
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
                        percent: user?.totalCompletePercent ?? 0,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${user?.totalStickers ?? 0} figurinhas",
                        style: context.textStyles.titleWhite,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      StatusTile(
                        icon: Image.asset("assets/images/all_icon.png"),
                        label: "Todas",
                        value: user?.totalAlbum ?? 0,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      StatusTile(
                        icon: Image.asset("assets/images/missing_icon.png"),
                        label: "Faltando",
                        value: user?.totalComplete ?? 0,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      StatusTile(
                        icon: Image.asset("assets/images/repeated_icon.png"),
                        label: "Repetidas",
                        value: user?.totalDuplicates ?? 0,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/my-stickers");
                        },
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
