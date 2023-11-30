import 'package:fifa_world_cup_app/app/core/ui/styles/button_styles.dart';
import 'package:fifa_world_cup_app/app/core/ui/styles/colors_app.dart';
import 'package:fifa_world_cup_app/app/core/ui/styles/text_app_styles.dart';
import 'package:fifa_world_cup_app/app/core/ui/widgets/app_button.dart';
import 'package:fifa_world_cup_app/app/pages/my_stickers/presenter/i_my_stickers_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class StickerStatusFilter extends StatelessWidget {

  final String filterSelected;

  const StickerStatusFilter({
    super.key,
    required this.filterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      width: MediaQuery.sizeOf(context).width,
      child: Wrap(
        spacing: 5,
        alignment: WrapAlignment.center,
        children: [
          _ButtonFilter(
            filterSelected: filterSelected, 
            type: "all", 
            label: "Todas",
          ),
          _ButtonFilter(
            filterSelected: filterSelected, 
            type: "missing", 
            label: "Faltando",
          ),
          _ButtonFilter(
            filterSelected: filterSelected, 
            type: "repeated", 
            label: "Repetidas",
          ),
        ],
      ),
    );
  }
}

class _ButtonFilter extends StatelessWidget {

  final String filterSelected;
  final String type;
  final String label;

  const _ButtonFilter({
    required this.filterSelected,
    required this.type,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      width: MediaQuery.sizeOf(context).width * 0.3,
      onPressed: () {
        context.get<IMyStickersPresenter>().statusFilter(type);
      },
      style: _getButtonStyle(context: context, type: type),
      labelStyle: _getLabelStyle(context: context, type: type),
      label: label,
    );
  }

  ButtonStyle _getButtonStyle({
    required BuildContext context,
    required String type,
  }) {
    if(filterSelected == type) {
      return context.buttonStyles.yellowButton;
    }

    return context.buttonStyles.primaryButton;
  }

  TextStyle _getLabelStyle({
    required BuildContext context,
    required String type,
  }) {
    if(filterSelected == type) {
      return context.textStyles.textSecondaryFontMedium.copyWith(
        color: context.colors.primary,
      );
    }

    return context.textStyles.textSecondaryFontMedium;
  }
}