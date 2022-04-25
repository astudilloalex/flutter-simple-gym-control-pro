import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_pro/src/app_controller.dart';
import 'package:simple_gym_control_pro/src/data/local/sqlite/src/company_sqlite.dart';
import 'package:simple_gym_control_pro/src/domain/entities/company.dart';
import 'package:simple_gym_control_pro/src/ui/routes/route_names.dart';

class OnboardingController extends GetxController {
  OnboardingController(this._appController);

  final AppController _appController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }

  void saveCompany() {
    if (!formKey.currentState!.validate()) return;
    const CompanySQLite sqlite = CompanySQLite();
    _appController.showOverlay(() async {
      try {
        final Company? company = await sqlite.save(
          Company(name: nameController.text.trim().toUpperCase()),
        );
        if (company != null) {
          Get.offNamed(RouteNames.signIn);
        }
      } on Exception catch (e) {
        _appController.showError(e.toString());
      }
    });
  }

  String? validateCompanyName(String? value) {
    return _appController.inputValidations.validateMinLength(value?.trim(), 3);
  }
}
