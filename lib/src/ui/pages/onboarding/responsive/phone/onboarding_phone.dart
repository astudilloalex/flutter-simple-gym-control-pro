import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_pro/src/ui/pages/onboarding/onboarding_controller.dart';
import 'package:simple_gym_control_pro/src/ui/pages/onboarding/widgets/onboarding_company_name_input.dart';

class OnboardingPhone extends StatelessWidget {
  const OnboardingPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.find<OnboardingController>();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 16.0),
              Text(
                'welcome'.tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Image.asset('assets/images/welcome_page.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'beforeStartingAddNameBusiness'.tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: OnboardingCompanyNameInput(),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton.icon(
                  onPressed: controller.saveCompany,
                  icon: Text('continue'.tr),
                  label: Icon(Icons.adaptive.arrow_forward_outlined),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
