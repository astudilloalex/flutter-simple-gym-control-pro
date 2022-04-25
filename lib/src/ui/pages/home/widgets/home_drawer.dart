import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_pro/src/ui/pages/home/home_controller.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key, this.elevation}) : super(key: key);

  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: elevation,
      child: Column(
        children: [
          GetBuilder<HomeController>(builder: (controller) {
            if (controller.company.iconMemory != null) {
              return Image.memory(controller.company.iconMemory!);
            } else if (controller.company.iconURL != null) {
              return Image.network(controller.company.iconURL!);
            }
            return Image.asset('assets/images/drawer_header.jpg');
          }),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: const Icon(Icons.person_outline),
                  onTap: () {},
                  title: Text('employees'.tr),
                ),
                ListTile(
                  leading: const Icon(Icons.card_membership_outlined),
                  onTap: () {},
                  title: Text('memberList'.tr),
                ),
                ListTile(
                  leading: const Icon(Icons.settings_outlined),
                  onTap: () {},
                  title: Text('settings'.tr),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
