import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_pro/src/app_controller.dart';
import 'package:simple_gym_control_pro/src/ui/pages/splash/splash_controller.dart';
import 'package:simple_gym_control_pro/src/ui/routes/route_names.dart';
import 'package:simple_gym_control_pro/src/ui/widgets/custom_progress_indicator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    final SplashController controller = SplashController(
      Get.find<AppController>(),
    );
    controller.companyExist().then((value) {
      if (value) {
        Get.offNamed(RouteNames.signIn);
      } else {
        Get.offNamed(RouteNames.onboarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomProgressIndicator(),
    );
  }
}
