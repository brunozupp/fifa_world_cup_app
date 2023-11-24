
import 'package:flutter/widgets.dart';

class ColorsApp {

  static ColorsApp? _instance;

  ColorsApp._();
  
  static ColorsApp get i =>
    _instance ??= ColorsApp._();

    Color get primary => const Color(0XFF791435);
    
    Color get secondary => const Color(0XFFFDCE50);

    Color get yellow => const Color(0XFFFDCE50);

    Color get grey => const Color(0XFFCCCCCC);

    Color get greyDark => const Color(0XFF999999);
}

extension ColorsAppExtension on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}