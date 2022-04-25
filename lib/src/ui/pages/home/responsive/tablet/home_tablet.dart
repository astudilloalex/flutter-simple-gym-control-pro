import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_pro/src/ui/pages/home/home_controller.dart';
import 'package:simple_gym_control_pro/src/ui/pages/home/responsive/tablet/widgets/home_tablet_members_card.dart';
import 'package:simple_gym_control_pro/src/ui/pages/home/widgets/home_drawer.dart';

class HomeTablet extends StatelessWidget {
  const HomeTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            const SizedBox(width: 240.0, child: HomeDrawer(elevation: 0.0)),
            Expanded(
              child: Scaffold(
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
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: HomeTabletMembersCard(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
