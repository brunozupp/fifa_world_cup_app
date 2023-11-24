import 'package:fifa_world_cup_app/app/core/ui/styles/button_styles.dart';
import 'package:fifa_world_cup_app/app/core/ui/styles/text_app_styles.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {

  final ButtonStyle style;
  final TextStyle labelStyle;
  final String label;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final bool outline;

  const AppButton({
    super.key,
    required this.style,
    required this.labelStyle,
    required this.label,
    this.width,
    this.height,
    this.onPressed,
    this.outline = false,
  });

  AppButton.primary({
    super.key,
    required this.label,
    this.width,
    this.height,
    this.onPressed,
  }) : style = ButtonStyles.i.primaryButton,
       labelStyle = TextAppStyles.i.textSecondaryFontExtraBold,
       outline = false;

  @override
  Widget build(BuildContext context) {

    final labelText = Text(
      label,
      style: labelStyle,
      overflow: TextOverflow.ellipsis,
    );

    return SizedBox(
      width: width,
      height: height,
      child: Visibility(
        visible: outline,
        replacement: ElevatedButton(
          onPressed: onPressed,
          style: style,
          child: labelText,
        ),
        child: OutlinedButton(
          onPressed: onPressed,
          style: style,
          child: labelText,
        ),
      ),
    );
  }
}
