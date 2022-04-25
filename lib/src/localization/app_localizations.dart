import 'package:get/get.dart';
import 'package:simple_gym_control_pro/src/localization/languages/app_en_us.dart';

class AppLocalizations implements Translations {
  const AppLocalizations();

  @override
  Map<String, Map<String, String>> get keys {
    return {
      'en_US': appEnUs,
    };
  }
}
