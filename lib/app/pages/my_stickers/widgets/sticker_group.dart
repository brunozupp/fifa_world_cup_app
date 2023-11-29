import 'package:fifa_world_cup_app/app/core/ui/styles/colors_app.dart';
import 'package:fifa_world_cup_app/app/core/ui/styles/text_app_styles.dart';
import 'package:flutter/material.dart';

class StickerGroup extends StatelessWidget {
  const StickerGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 64,
            child: OverflowBox( // Vai expandir o elemento o máximo que dá. Dessa forma eu contorno a questão de tamanho da imagem
              maxWidth: double.infinity,
              maxHeight: double.infinity,
              child: ClipRect( // Usando isso para conseguir diminuir a imagem em questão de comprimento. Vai deixar os fatores do Align sem aplicados
                child: Align(
                  widthFactor: 1, // Vai ocupar 100% da tela (largura)
                  heightFactor: 0.1, // Vai ocupar 10% da tela (comprimento)
                  alignment: const Alignment(0, -0.1),
                  child: Image.asset(
                    "assets/images/flags/BRA.png",
                    cacheWidth: (MediaQuery.sizeOf(context).width * 3).toInt(),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Brasil",
              style: context.textStyles.titleBlack.copyWith(
                fontSize: 26,
              ),
            ),
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return _Sticker(
                index: index,
              );
            },
          )
        ],
      ),
    );
  }
}

class _Sticker extends StatelessWidget {
  
  final int index;
  
  const _Sticker({
    required this.index
  });

  @override
  Widget build(BuildContext context) {

    final isEven = index % 2 == 0;

    return InkWell(
      onTap: () {},
      child: Container(
        color: isEven
          ? context.colors.primary
          : context.colors.grey,
        child: Column(
          children: [
            Visibility(
              visible: isEven,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(2),
                child: Text(
                  "1",
                  style: context.textStyles.textSecondaryFontMedium.copyWith(
                    color: context.colors.yellow,
                  ),
                ),
              ),
            ),
            Text(
              "BRA",
              style: context.textStyles.textSecondaryFontExtraBold.copyWith(
                color: isEven ? Colors.white : Colors.black,
              ),
            ),
            Text(
              "$index",
              style: context.textStyles.textSecondaryFontExtraBold.copyWith(
                color: isEven ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}