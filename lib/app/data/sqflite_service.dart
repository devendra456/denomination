import 'dart:async';

import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import 'migration_script.dart';


class SQFLiteService extends GetxService {
  static const String _databaseName = "com.ptpl.denomination";
  static Database? _database;

  @override
  void onInit() {
    super.onInit();
    database;
  }

  Future<Database?> get database async {
    if (_database != null) return _database;
    try {
      _database = await _initDatabase();
    } catch (e) {
      Get.log(e.toString());
    }
    return _database;
  }

  Future<Database> _initDatabase() async {
    try {
      final dbPath = await getDatabasesPath();
      String path = "$dbPath/$_databaseName";
      return await openDatabase(
        path,
        version: migrationScript.length,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
      );
    } catch (e) {
      Get.log(e.toString());
      rethrow;
    }
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    try {
      for (int i = 0; i < migrationScript.length; i++) {
        for (int j = 0; j < migrationScript[i].length; j++) {
          await db.execute(migrationScript[i][j].toString());
        }
      }
    } catch (e) {
      Get.log(e.toString());
    }
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    try {
      for (int i = oldVersion; i <= newVersion - 1; i++) {
        for (int j = 0; j < migrationScript[i].length; j++) {
          await db.execute(migrationScript[i][j].toString());
        }
      }
    } catch (e) {
      Get.log(e.toString());
    }
  }

  @override
  void onClose() {
    _database?.close();
  }
}
