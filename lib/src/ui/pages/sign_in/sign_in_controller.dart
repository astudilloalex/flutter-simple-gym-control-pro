import 'package:bcrypt/bcrypt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_pro/src/app_controller.dart';
import 'package:simple_gym_control_pro/src/data/local/sqlite/src/user_sqlite.dart';
import 'package:simple_gym_control_pro/src/domain/entities/user.dart';
import 'package:simple_gym_control_pro/src/ui/routes/route_names.dart';

class SignInController extends GetxController {
  SignInController(this._appController);

  final AppController _appController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool _rememberPassword = RxBool(false);
  final RxBool _viewPassword = RxBool(false);

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void changeRememberPassword({final bool? value}) {
    if (value != null) _rememberPassword(value);
  }

  void changeViewPassword() {
    _viewPassword(!_viewPassword.value);
  }

  void signIn() {
    if (!formKey.currentState!.validate()) return;
    _appController.showOverlay(() async {
      try {
        const UserSQLite sqlite = UserSQLite();
        final User? user = await sqlite.findByUsername(
          usernameController.text.trim(),
        );
        if (user != null) {
          if (!BCrypt.checkpw(passwordController.text, user.password)) {
            _appController.showError('incorrectPassword'.tr);
          } else {
            Get.offNamed(RouteNames.home);
          }
        } else {
          _appController.showError('usernameDoesNotExist'.tr);
        }
      } catch (e) {
        _appController.showError(e.toString());
      }
    });
  }

  bool get rememberPassword => _rememberPassword.value;
  bool get viewPassword => _viewPassword.value;
}
