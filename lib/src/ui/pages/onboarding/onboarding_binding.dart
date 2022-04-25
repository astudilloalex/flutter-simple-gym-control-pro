import 'package:get/get.dart';
import 'package:simple_gym_control_pro/src/app_controller.dart';
import 'package:simple_gym_control_pro/src/ui/pages/onboarding/onboarding_controller.dart';

class OnboardingBinding implements Bindings {
  const OnboardingBinding();

  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(
      () => OnboardingController(Get.find<AppController>()),
    );
  }
}
