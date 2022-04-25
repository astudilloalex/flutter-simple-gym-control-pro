import 'package:flutter/material.dart';
import 'package:responsive_design/responsive_design.dart';
import 'package:simple_gym_control_pro/src/ui/pages/home/responsive/phone/home_phone.dart';
import 'package:simple_gym_control_pro/src/ui/pages/home/responsive/tablet/home_tablet.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      phone: HomePhone(),
      tablet: HomeTablet(),
    );
  }
}
