import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_pro/src/ui/pages/onboarding/onboarding_controller.dart';

class OnboardingCompanyNameInput extends StatelessWidget {
  const OnboardingCompanyNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.find<OnboardingController>();
    return Form(
      key: controller.formKey,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller.nameController,
        decoration: InputDecoration(
          hintText: 'companyName'.tr,
        ),
        textCapitalization: TextCapitalization.characters,
        validator: controller.validateCompanyName,
      ),
    );
  }
}
