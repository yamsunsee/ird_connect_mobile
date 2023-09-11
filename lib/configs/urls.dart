import 'package:flutter_dotenv/flutter_dotenv.dart';

class UrlsConfig {
  static String userRegister = '${dotenv.get('RDIC_URL')}/signup';

  static String userLogin = '${dotenv.get('RDIC_URL')}/token-issuer';

  static String userInformation = '${dotenv.get('RDIC_URL')}/identification-information';

  static String bugTrackDashboard = '${dotenv.get('BUGTRACK_URL')}/dashboard';
}
