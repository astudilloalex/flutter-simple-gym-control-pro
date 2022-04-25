import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_gym_control_pro/src/app.dart';
import 'package:simple_gym_control_pro/src/data/local/sqlite/src/user_sqlite.dart';
import 'package:simple_gym_control_pro/src/domain/entities/role.dart';
import 'package:simple_gym_control_pro/src/domain/entities/user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}
