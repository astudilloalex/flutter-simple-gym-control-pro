import 'package:flutter/material.dart';
import 'package:responsive_design/responsive_design.dart';
import 'package:simple_gym_control_pro/src/ui/pages/onboarding/responsive/phone/onboarding_phone.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      phone: OnboardingPhone(),
    );
  }
}
