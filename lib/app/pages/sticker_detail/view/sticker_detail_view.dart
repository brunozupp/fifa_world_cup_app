import 'package:fifa_world_cup_app/app/core/ui/helpers/app_loader.dart';
import 'package:fifa_world_cup_app/app/core/ui/helpers/app_messages.dart';
import 'package:fifa_world_cup_app/app/pages/sticker_detail/sticker_detail_page.dart';
import 'package:fifa_world_cup_app/app/pages/sticker_detail/view/i_sticker_detail_view.dart';
import 'package:flutter/widgets.dart';

abstract class StickerDetailView extends State<StickerDetailPage> with AppLoader, AppMessages implements IStickerDetailView {
  
  bool hasSticker = false;
  String countryCode = "";
  String stickerNumber = "";
  String countryName = "";
  int amount = 0;

  @override
  void initState() {
    widget.presenter.view = this;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { 

      showLoader();

      final arguments = ModalRoute.of(context)?.settings.arguments;

      if(arguments != null && arguments is Map<String,dynamic>) {
        widget.presenter.load(
          countryCode: arguments["countryCode"],
          stickerNumber: arguments["stickerNumber"],
          countryName: arguments["countryName"],
          stickerUser: arguments["stickerUser"],
        );
      } else {
        hideLoader();
        Navigator.of(context).pop();
        showError("Não foi possível carregar a figurinha");
      }

      
    });

    super.initState();
  }

  @override
  void screenLoaded({
    required bool hasSticker,
    required String countryCode,
    required String stickerNumber,
    required String countryName,
    required int amount,
  }) {
    hideLoader();

    setState(() {
      this.hasSticker = hasSticker;
      this.countryCode = countryCode;
      this.stickerNumber = stickerNumber;
      this.countryName = countryName;
      this.amount = amount;
    });
  }

  @override
  void updateAmount(int amount) {
    setState(() {
      this.amount = amount;
    });
  }
}