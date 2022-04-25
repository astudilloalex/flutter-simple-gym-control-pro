import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:simple_gym_control_pro/src/ui/pages/home/home_binding.dart';
import 'package:simple_gym_control_pro/src/ui/pages/home/home_page.dart';
import 'package:simple_gym_control_pro/src/ui/pages/onboarding/onboarding_binding.dart';
import 'package:simple_gym_control_pro/src/ui/pages/onboarding/onboarding_page.dart';
import 'package:simple_gym_control_pro/src/ui/pages/sign_in/sign_in_binding.dart';
import 'package:simple_gym_control_pro/src/ui/pages/sign_in/sign_in_page.dart';
import 'package:simple_gym_control_pro/src/ui/pages/splash/splash_page.dart';
import 'package:simple_gym_control_pro/src/ui/routes/route_names.dart';

class RoutePages {
  const RoutePages._();

  static List<GetPage<dynamic>> get all {
    return [
      GetPage(
        name: RouteNames.home,
        page: () => const HomePage(),
        binding: const HomeBinding(),
      ),
      GetPage(
        name: RouteNames.onboarding,
        page: () => const OnboardingPage(),
        binding: const OnboardingBinding(),
      ),
      GetPage(
        name: RouteNames.signIn,
        page: () => const SignInPage(),
        binding: const SignInBinding(),
      ),
      GetPage(
        name: RouteNames.splash,
        page: () => const SplashPage(),
        //binding: const SplashBinding(),
      ),
    ];
  }
}
