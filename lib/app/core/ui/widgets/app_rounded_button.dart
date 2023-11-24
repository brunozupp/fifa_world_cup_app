import 'package:fifa_world_cup_app/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class AppRoundedButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback onPressed;

  const AppRoundedButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      shadowColor: Colors.grey.withOpacity(0.2),
      shape: const CircleBorder(),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: IconButton(
          icon: Icon(
            icon,
            color: context.colors.greyDark,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
