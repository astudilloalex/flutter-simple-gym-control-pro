import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_pro/src/ui/pages/sign_in/sign_in_controller.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignInController controller = Get.find<SignInController>();
    return Form(
      key: controller.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: controller.usernameController,
            decoration: InputDecoration(
              hintText: 'username'.tr,
            ),
          ),
          const SizedBox(height: 16.0),
          Obx(() {
            return TextFormField(
              controller: controller.passwordController,
              decoration: InputDecoration(
                hintText: 'password'.tr,
                suffixIcon: IconButton(
                  onPressed: controller.changeViewPassword,
                  icon: Icon(
                    controller.viewPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                ),
              ),
              obscureText: !controller.viewPassword,
            );
          }),
        ],
      ),
    );
  }
}
