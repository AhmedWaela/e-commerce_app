import 'package:flutter_dotenv/flutter_dotenv.dart';

class DotEnvLoader{
  static Future<void> load({String fileName = ".env"}) async {
    await dotenv.load(fileName: fileName);
  }
}