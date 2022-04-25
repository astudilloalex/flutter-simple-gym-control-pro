import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:simple_gym_control_pro/src/ui/pages/home/home_controller.dart';

class HomeTotalMembersCard extends StatelessWidget {
  const HomeTotalMembersCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${'total'.tr}\n${'members'.tr}',
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 10.0),
                GetBuilder<HomeController>(
                  builder: (controller) {
                    return Text(
                      '${controller.totalMembers}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    );
                  },
                ),
              ],
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
      ),
    );
  }
}
