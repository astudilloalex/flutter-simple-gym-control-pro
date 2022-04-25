import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_pro/src/ui/pages/sign_in/widgets/sign_in_button.dart';
import 'package:simple_gym_control_pro/src/ui/pages/sign_in/widgets/sign_in_footer.dart';
import 'package:simple_gym_control_pro/src/ui/pages/sign_in/widgets/sign_in_form.dart';

class SignInWatch extends StatelessWidget {
  const SignInWatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Text(
          'welcomeBack'.tr,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 24.0,
          ),
        ),
      ),
      Image.asset('assets/images/sign_in_image.png'),
      const SignInForm(),
      const SignInButton(),
    ];
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            const SignInFooter(),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 460.0),
              child: ListView.separated(
                itemCount: widgets.length,
                itemBuilder: (_, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: widgets[index],
                ),
                separatorBuilder: (_, index) {
                  //if (index == 2) return const SizedBox(height: 10.0);
                  return const SizedBox(height: 16.0);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
