import 'package:flutter/material.dart';
import 'package:responsive_design/responsive_design.dart';
import 'package:simple_gym_control_pro/src/ui/pages/sign_in/responsive/desktop/sign_in_desktop.dart';
import 'package:simple_gym_control_pro/src/ui/pages/sign_in/responsive/phone/sign_in_phone.dart';
import 'package:simple_gym_control_pro/src/ui/pages/sign_in/responsive/tablet/sign_in_tablet.dart';
import 'package:simple_gym_control_pro/src/ui/pages/sign_in/responsive/watch/sign_in_watch.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      desktop: SignInDesktop(),
      phone: SignInPhone(),
      tablet: SignInTablet(),
      watch: SignInWatch(),
    );
  }
}
