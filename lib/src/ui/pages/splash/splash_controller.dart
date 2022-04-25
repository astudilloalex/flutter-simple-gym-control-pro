import 'package:simple_gym_control_pro/src/app_controller.dart';
import 'package:simple_gym_control_pro/src/data/local/sqlite/src/company_sqlite.dart';

class SplashController {
  const SplashController(this._appController);

  final AppController _appController;

  Future<bool> companyExist() async {
    const CompanySQLite sqlite = CompanySQLite();
    try {
      return sqlite.findAll().then((value) => value.isNotEmpty);
    } catch (e) {
      _appController.showError(e.toString());
    }
    return Future.value(false);
  }
}
