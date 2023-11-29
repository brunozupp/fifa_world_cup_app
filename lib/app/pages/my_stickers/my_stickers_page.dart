import 'package:fifa_world_cup_app/app/pages/my_stickers/presenter/i_my_stickers_presenter.dart';
import 'package:fifa_world_cup_app/app/pages/my_stickers/view/my_stickers_view.dart';
import 'package:fifa_world_cup_app/app/pages/my_stickers/widgets/sticker_group_filter.dart';
import 'package:fifa_world_cup_app/app/pages/my_stickers/widgets/sticker_status_filter.dart';
import 'package:flutter/material.dart';

class MyStickersPage extends StatefulWidget {

  final IMyStickersPresenter presenter;

  const MyStickersPage({
    super.key,
    required this.presenter,
  });

  @override
  State<MyStickersPage> createState() => _MyStickersPageState();
}

class _MyStickersPageState extends MyStickersView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                StickerStatusFilter(
                  filterSelected: "",
                ),
                StickerGroupFilter(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
