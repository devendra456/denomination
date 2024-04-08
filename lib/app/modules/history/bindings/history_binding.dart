import 'package:denomination/app/core/di.dart';
import 'package:get/get.dart';

import '../controllers/history_controller.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryController>(
      () => HistoryController(sqfLiteService: getIt()),
    );
  }
}
