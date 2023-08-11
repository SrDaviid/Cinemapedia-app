import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String movieApiKey =
      dotenv.env['MOVIEDB_KEY'] ?? 'MOVIEDB_KEY not found';
}
