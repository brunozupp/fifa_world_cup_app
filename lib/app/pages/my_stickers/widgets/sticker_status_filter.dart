import 'package:fifa_world_cup_app/app/core/ui/styles/button_styles.dart';
import 'package:fifa_world_cup_app/app/core/ui/styles/colors_app.dart';
import 'package:fifa_world_cup_app/app/core/ui/styles/text_app_styles.dart';
import 'package:fifa_world_cup_app/app/core/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';

class StickerStatusFilter extends StatelessWidget {

  final String filterSelected;

  const StickerStatusFilter({
    super.key,
    required this.filterSelected,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.sizeOf(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      width: MediaQuery.sizeOf(context).width,
      child: Wrap(
        spacing: 5,
        alignment: WrapAlignment.center,
        children: [
          AppButton(
            width: size.width * 0.3,
            onPressed: () {},
            style: context.buttonStyles.yellowButton,
            labelStyle: context.textStyles.textSecondaryFontMedium.copyWith(
              color: context.colors.primary,
            ),
            label: "Todas",
          ),
          AppButton(
            width: size.width * 0.3,
            onPressed: () {},
            style: context.buttonStyles.primaryButton,
            labelStyle: context.textStyles.textSecondaryFontMedium,
            label: "Faltando",
          ),
          AppButton(
            width: size.width * 0.3,
            onPressed: () {},
            style: context.buttonStyles.primaryButton,
            labelStyle: context.textStyles.textSecondaryFontMedium,
            label: "Repetidas",
          ),
        ],
      ),
    );
  }
}
