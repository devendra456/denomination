import 'package:denomination/app/core/di.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<HomeController>(
      () => HomeController(
        appPreferences: getIt(),
        sqfLiteService: getIt(),
      ),
    );
  }
}
