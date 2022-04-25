import 'package:get/get.dart';
import 'package:simple_gym_control_pro/src/ui/utilities/input_validations.dart';
import 'package:simple_gym_control_pro/src/ui/widgets/custom_progress_indicator.dart';
import 'package:simple_gym_control_pro/src/ui/widgets/snackbars/error_snackbar.dart';

class AppController extends GetxController {
  AppController({
    required this.inputValidations,
  });

  final InputValidations inputValidations;

  void showError(final String error) {
    if (Get.isSnackbarOpen) Get.back();
    Get.showSnackbar(ErrorSnackbar(error));
  }

  void showOverlay(final Future Function() asyncFunction) {
    Get.showOverlay(
      loadingWidget: const CustomProgressIndicator(),
      asyncFunction: asyncFunction,
    );
  }
}
