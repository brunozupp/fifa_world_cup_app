import 'package:fifa_world_cup_app/app/core/ui/styles/button_styles.dart';
import 'package:fifa_world_cup_app/app/core/ui/styles/text_app_styles.dart';
import 'package:fifa_world_cup_app/app/core/ui/widgets/app_button.dart';
import 'package:fifa_world_cup_app/app/core/ui/widgets/app_rounded_button.dart';
import 'package:flutter/material.dart';

class StickerDetailPage extends StatefulWidget {
  const StickerDetailPage({super.key});

  @override
  State<StickerDetailPage> createState() => _StickerDetailPageState();
}

class _StickerDetailPageState extends State<StickerDetailPage> {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe Figurinha'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/sticker.png"),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "BRA 17",
                      style: context.textStyles.textPrimaryFontBold.copyWith(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  const Spacer(),
                  AppRoundedButton(
                    icon: Icons.remove, 
                    onPressed: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Text(
                      "1",
                      style: context.textStyles.textSecondaryFontMedium,
                    ),
                  ),
                  AppRoundedButton(
                    icon: Icons.add, 
                    onPressed: () {},
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 15,
                  bottom: 10,
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Brasil",
                  style: context.textStyles.textPrimaryFontRegular,
                ),
              ),
              AppButton.primary(
                width: size.width * .9,
                label: "Adicionar figurinha",
                onPressed: () {},
              ),
              AppButton(
                style: context.buttonStyles.primaryOutlineButton,
                labelStyle: context.textStyles.textSecondaryFontExtraBoldPrimaryColor,
                label: "Excluir figurinha",
                outline: true,
                width: size.width * .9
              ),
            ],
          ),
        ),
      ),
    );
  }
}
