abstract class IStickerDetailView {
  void screenLoaded({
    required bool hasSticker,
    required String countryCode,
    required String stickerNumber,
    required String countryName,
    required int amount,
  });

  void updateAmount(int amount);
}