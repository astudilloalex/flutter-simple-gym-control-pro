import 'package:flutter/material.dart';
import 'package:simple_gym_control_pro/src/ui/pages/home/widgets/home_drawer.dart';

class HomeWatch extends StatelessWidget {
  const HomeWatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const HomeDrawer(),
    );
  }
}
