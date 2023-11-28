import 'package:fifa_world_cup_app/app/core/config/env/env.dart';
import 'package:fifa_world_cup_app/app/fifa_app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {

  await Env.i.load();

  runApp(FifaApp());
}