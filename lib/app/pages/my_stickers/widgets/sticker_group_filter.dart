import 'package:fifa_world_cup_app/app/core/ui/styles/text_app_styles.dart';
import 'package:fifa_world_cup_app/app/pages/my_stickers/presenter/i_my_stickers_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';
import 'package:flutter_getit/flutter_getit.dart';

class StickerGroupFilter extends StatefulWidget {

  final Map<String, String> countries;

  const StickerGroupFilter({
    super.key,
    required this.countries,
  });

  @override
  State<StickerGroupFilter> createState() => _StickerGroupFilterState();
}

class _StickerGroupFilterState extends State<StickerGroupFilter> {

  List<String>? selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SmartSelect<String>.multiple(
        title: "Filtro",
        tileBuilder: (context, state) {
          return InkWell(
            onTap: state.showModal,
            child: _StickerGroupTile(
              label: state.selected.title?.join(", ") ?? "Filtro",
              clearCallback: () {
                setState(() {
                  selected = null;
                  context.get<IMyStickersPresenter>().countryFilter(selected);
                });
              },
            ),
          );
        },
        selectedValue: selected ?? [],
        onChange: (selectedValue) {
          setState(() {
            selected = selectedValue.value;
          });
          context.get<IMyStickersPresenter>().countryFilter(selected);
        },
        choiceItems: S2Choice.listFrom(
          source: widget.countries.entries.map((map) => {
            "value": map.key,
            "title": map.value,
          }).toList(),
          value: (index, item) => item["value"] ?? "",
          title: (index, item) => item["title"] ?? "",
        ),
        choiceType: S2ChoiceType.switches,
        modalType: S2ModalType.bottomSheet,
        choiceGrouped: true,
        modalFilter: false,
        placeholder: "",
      ),
    );
  }
}

class _StickerGroupTile extends StatelessWidget {

  final String label;
  final VoidCallback clearCallback;

  const _StickerGroupTile({
    required this.label,
    required this.clearCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            const Icon(
              Icons.filter_list,
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                label,
                style: context.textStyles.textSecondaryFontRegular.copyWith(
                  fontSize: 11,
                ),
              ),
            ),
            InkWell(
              onTap: clearCallback,
              child: const Icon(Icons.clear),
            ),
          ],
        ),
      ),
    );
  }
}