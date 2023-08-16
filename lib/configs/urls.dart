import 'package:flutter_dotenv/flutter_dotenv.dart';

class UrlsConfig {
  static String userLogin = '${dotenv.get('RDIC_URL')}/token-issuer';

  static String userInformation = '${dotenv.get('RDIC_URL')}/identification-information';
}
