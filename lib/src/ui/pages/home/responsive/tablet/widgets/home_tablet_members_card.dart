import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:simple_gym_control_pro/src/ui/pages/home/home_controller.dart';

class HomeTabletMembersCard extends StatelessWidget {
  const HomeTabletMembersCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      width: 200.0,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${'total'.tr}\n${'members'.tr}',
                style: const TextStyle(
                  fontSize: 25.0,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GetBuilder<HomeController>(
                      builder: (controller) {
                        return Text(
                          '${controller.totalMembers}',
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                  GetBuilder<HomeController>(
                    builder: (controller) {
                      return CircularPercentIndicator(
                        radius: 40.0,
                        percent: controller.totalMembers > controller.memberGoal
                            ? 1.0
                            : controller.totalMembers / controller.memberGoal,
                        backgroundColor: Colors.green.withOpacity(0.15),
                        lineWidth: 10.0,
                        progressColor: Colors.green,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
