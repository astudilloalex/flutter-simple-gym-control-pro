import 'package:get/get.dart';
import 'package:simple_gym_control_pro/src/app_controller.dart';
import 'package:simple_gym_control_pro/src/data/local/sqlite/src/company_sqlite.dart';
import 'package:simple_gym_control_pro/src/data/local/sqlite/src/customer_sqlite.dart';
import 'package:simple_gym_control_pro/src/domain/entities/company.dart';

class HomeController extends GetxController {
  HomeController(this._appController);

  final AppController _appController;

  bool _loading = true;
  Company _company = const Company(name: '');
  int _totalMembers = 0;

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  Future<void> _load() async {
    try {
      const CompanySQLite sqlite = CompanySQLite();
      _company = (await sqlite.findAll()).first;
      _totalMembers = await const CustomerSQLite().count();
    } catch (e) {
      _appController.showError(e.toString());
    } finally {
      _loading = false;
      update();
    }
  }

  bool get loading => _loading;
  int get totalMembers => _totalMembers;
  int get memberGoal => 10000;
  Company get company => _company;
}
