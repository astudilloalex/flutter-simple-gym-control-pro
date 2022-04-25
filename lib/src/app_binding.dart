import 'package:get/get.dart';
import 'package:simple_gym_control_pro/src/app_controller.dart';
import 'package:simple_gym_control_pro/src/ui/utilities/input_validations.dart';

class AppBinding implements Bindings {
  const AppBinding();

  @override
  void dependencies() {
    Get.put<AppController>(
      AppController(
        inputValidations: const InputValidations(),
      ),
      permanent: true,
    );
  }
}
