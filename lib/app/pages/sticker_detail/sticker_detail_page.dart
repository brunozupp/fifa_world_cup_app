import 'package:fifa_world_cup_app/app/core/ui/styles/button_styles.dart';
import 'package:fifa_world_cup_app/app/core/ui/styles/text_app_styles.dart';
import 'package:fifa_world_cup_app/app/core/ui/widgets/app_button.dart';
import 'package:fifa_world_cup_app/app/core/ui/widgets/app_rounded_button.dart';
import 'package:fifa_world_cup_app/app/pages/sticker_detail/presenter/i_sticker_detail_presenter.dart';
import 'package:fifa_world_cup_app/app/pages/sticker_detail/view/sticker_detail_view.dart';
import 'package:flutter/material.dart';

class StickerDetailPage extends StatefulWidget {

  final IStickerDetailPresenter presenter;

  const StickerDetailPage({
    super.key,
    required this.presenter,
  });

  @override
  State<StickerDetailPage> createState() => _StickerDetailPageState();
}

class _StickerDetailPageState extends StickerDetailView {
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
              Image.asset(
                hasSticker
                  ? "assets/images/sticker.png"
                  : "assets/images/sticker_pb.png"
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "$countryCode $stickerNumber",
                      style: context.textStyles.textPrimaryFontBold.copyWith(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  const Spacer(),
                  AppRoundedButton(
                    icon: Icons.remove, 
                    onPressed: widget.presenter.decrementAmount,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Text(
                      "$amount",
                      style: context.textStyles.textSecondaryFontMedium,
                    ),
                  ),
                  AppRoundedButton(
                    icon: Icons.add, 
                    onPressed: widget.presenter.incrementAmount,
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
                  countryName,
                  style: context.textStyles.textPrimaryFontRegular,
                ),
              ),
              AppButton.primary(
                width: size.width * .9,
                label: "${hasSticker ? 'Atualizar' : 'Adicionar'} figurinha",
                onPressed: widget.presenter.saveSticker,
              ),
              AppButton(
                onPressed: widget.presenter.deleteSticker,
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
