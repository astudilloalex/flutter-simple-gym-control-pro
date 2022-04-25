import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_pro/src/ui/pages/home/home_controller.dart';
import 'package:simple_gym_control_pro/src/ui/pages/home/responsive/phone/widgets/home_phone_members_card.dart';
import 'package:simple_gym_control_pro/src/ui/pages/home/widgets/home_drawer.dart';
import 'package:simple_gym_control_pro/src/ui/pages/home/widgets/home_total_members_card.dart';

class HomePhone extends StatelessWidget {
  const HomePhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetBuilder<HomeController>(
          builder: (controller) {
            return Text(controller.company.name);
          },
        ),
      ),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: HomePhoneMembersCard(),
          ),
        ],
      ),
      drawer: const HomeDrawer(),
    );
  }
}
