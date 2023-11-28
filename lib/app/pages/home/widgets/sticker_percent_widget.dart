import 'dart:math';

import 'package:fifa_world_cup_app/app/core/ui/styles/colors_app.dart';
import 'package:fifa_world_cup_app/app/core/ui/styles/text_app_styles.dart';
import 'package:flutter/material.dart';

class StickerPercentWidget extends StatelessWidget {
  
  final int percent;
  
  const StickerPercentWidget({
    super.key,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: context.colors.grey,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              "$percent%",
              style: context.textStyles.titlePrimaryColor,
            ),
          ),
        ),
        SizedBox.square(
          dimension: 110,
          child: Transform.rotate(
            angle: -pi / 2.5,
            child: CircularProgressIndicator(
              color: Colors.white,
              backgroundColor: Colors.white.withOpacity(0.5),
              strokeWidth: 5,
              value: percent / 100,
            ),
          ),
        ),
      ],
    );
  }
}
