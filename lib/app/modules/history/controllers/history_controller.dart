import 'package:denomination/app/data/sqflite_service.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  final SQFLiteService sqfLiteService;

  HistoryController({required this.sqfLiteService});

  Future<List<Map<String, Object?>>?> getSaveData() async {
    final db = await sqfLiteService.database;
    return db?.rawQuery("SELECT * FROM Denomination ORDER BY id DESC");
  }
}
