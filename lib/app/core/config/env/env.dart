import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static Env? _instance;
  
  Env._();
  
  static Env get i => _instance ??= Env._();

  Future<void> load() async => await dotenv.load(fileName: '.env');

  String? operator [](String key) => dotenv.env[key];
}