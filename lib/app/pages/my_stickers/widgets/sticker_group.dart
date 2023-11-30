import 'package:fifa_world_cup_app/app/core/ui/styles/colors_app.dart';
import 'package:fifa_world_cup_app/app/core/ui/styles/text_app_styles.dart';
import 'package:fifa_world_cup_app/app/models/groups_stickers.dart';
import 'package:fifa_world_cup_app/app/models/user_sticker_model.dart';
import 'package:flutter/material.dart';

class StickerGroup extends StatelessWidget {

  final GroupsStickers group;
  final String statusFilter;

  const StickerGroup({super.key, required this.group, required this.statusFilter,});

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
                  child: Image.network(
                    group.flag,
                    cacheWidth: (MediaQuery.sizeOf(context).width * 3).toInt(),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              group.countryName,
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

              final stickerNumber = "${group.stickersStart + index}";
              final stickerList = group.stickers.where((sticker) => sticker.stickerNumber == stickerNumber);

              // Indica que não tem a figurinha
              final sticker = stickerList.firstOrNull;

              final countryName = group.countryName;
              final countryCode = group.countryCode;

              final stickerWidget =  _Sticker(
                index: stickerNumber,
                sticker: sticker,
                countryName: countryName,
                countryCode: countryCode,
              );

              if(statusFilter == "all") {
                return stickerWidget;
              } else if(statusFilter == "missing") {
                if(sticker == null) {
                  return stickerWidget;
                }
              } else if(statusFilter == "repeated") {
                if(sticker != null && sticker.duplicate > 0) {
                  return stickerWidget;
                }
              }

              return const SizedBox.shrink();
            },
          )
        ],
      ),
    );
  }
}

class _Sticker extends StatelessWidget {
  
  final UserStickerModel? sticker;
  final String index;
  final String countryName;
  final String countryCode;
  
  const _Sticker({
    required this.sticker,
    required this.index,
    required this.countryName,
    required this.countryCode,
  });

  @override
  Widget build(BuildContext context) {

    final hasSticker = sticker != null;

    return InkWell(
      onTap: () {},
      child: Container(
        color: hasSticker
          ? context.colors.primary
          : context.colors.grey,
        child: Column(
          children: [
            Visibility(
              visible: hasSticker && sticker!.duplicate > 0,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(2),
                child: Text(
                  sticker?.duplicate.toString() ?? "0",
                  style: context.textStyles.textSecondaryFontMedium.copyWith(
                    color: context.colors.yellow,
                  ),
                ),
              ),
            ),
            Text(
              countryCode,
              style: context.textStyles.textSecondaryFontExtraBold.copyWith(
                color: hasSticker ? Colors.white : Colors.black,
              ),
            ),
            Text(
              index,
              style: context.textStyles.textSecondaryFontExtraBold.copyWith(
                color: hasSticker ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}