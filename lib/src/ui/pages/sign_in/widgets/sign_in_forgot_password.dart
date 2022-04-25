import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInForgotPassword extends StatelessWidget {
  const SignInForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        child: Text(
          'forgotPassword'.tr,
        ),
        onTap: () {},
      ),
    );
  }
}
