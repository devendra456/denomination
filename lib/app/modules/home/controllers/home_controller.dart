import 'package:denomination/app/core/preferences/app_preferences.dart';
import 'package:denomination/app/core/preferences/app_preferences_keys.dart';
import 'package:denomination/app/data/sqflite_service.dart';
import 'package:denomination/app/modules/home/models/denomi_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final AppPreferences appPreferences;
  final SQFLiteService sqfLiteService;
  RxInt count = 0.obs;

  final DenomiModel denomi2000 = DenomiModel(
    amount: 2000,
    controller: TextEditingController(),
    showClearButton: RxBool(false),
    value: RxInt(0),
    hintText: "Try 6",
  );

  final DenomiModel denomi500 = DenomiModel(
    amount: 500,
    controller: TextEditingController(),
    showClearButton: RxBool(false),
    value: RxInt(0),
  );

  final DenomiModel denomi200 = DenomiModel(
    amount: 200,
    controller: TextEditingController(),
    showClearButton: RxBool(false),
    value: RxInt(0),
  );

  final DenomiModel denomi100 = DenomiModel(
    amount: 100,
    controller: TextEditingController(),
    showClearButton: RxBool(false),
    value: RxInt(0),
  );

  final DenomiModel denomi50 = DenomiModel(
    amount: 50,
    controller: TextEditingController(),
    showClearButton: RxBool(false),
    value: RxInt(0),
  );

  final DenomiModel denomi20 = DenomiModel(
    amount: 20,
    controller: TextEditingController(),
    showClearButton: RxBool(false),
    value: RxInt(0),
  );

  final DenomiModel denomi10 = DenomiModel(
    amount: 10,
    controller: TextEditingController(),
    showClearButton: RxBool(false),
    value: RxInt(0),
  );

  final DenomiModel denomi5 = DenomiModel(
    amount: 5,
    controller: TextEditingController(),
    showClearButton: RxBool(false),
    value: RxInt(0),
  );

  final DenomiModel denomi2 = DenomiModel(
    amount: 2,
    controller: TextEditingController(),
    showClearButton: RxBool(false),
    value: RxInt(0),
  );
  final DenomiModel denomi1 = DenomiModel(
    amount: 1,
    controller: TextEditingController(),
    showClearButton: RxBool(false),
    value: RxInt(0),
  );

  HomeController({
    required this.appPreferences,
    required this.sqfLiteService,
  });

  @override
  void onInit() {
    super.onInit();
    getControllerValues();
  }

  void updateCount() {
    final c = denomi2000.value.value +
        denomi500.value.value +
        denomi200.value.value +
        denomi100.value.value +
        denomi50.value.value +
        denomi20.value.value +
        denomi10.value.value +
        denomi5.value.value +
        denomi2.value.value +
        denomi1.value.value;
    count.value = c;
  }

  void clearAll() {
    denomi2000.showClearButton.value = false;
    denomi2000.controller.clear();
    denomi2000.value.value = 0;
    denomi500.showClearButton.value = false;
    denomi500.controller.clear();
    denomi500.value.value = 0;
    denomi200.showClearButton.value = false;
    denomi200.controller.clear();
    denomi200.value.value = 0;
    denomi100.showClearButton.value = false;
    denomi100.controller.clear();
    denomi100.value.value = 0;
    denomi50.showClearButton.value = false;
    denomi50.controller.clear();
    denomi50.value.value = 0;
    denomi20.showClearButton.value = false;
    denomi20.controller.clear();
    denomi20.value.value = 0;
    denomi10.showClearButton.value = false;
    denomi10.controller.clear();
    denomi10.value.value = 0;
    denomi5.showClearButton.value = false;
    denomi5.controller.clear();
    denomi5.value.value = 0;
    denomi2.showClearButton.value = false;
    denomi2.controller.clear();
    denomi2.value.value = 0;
    denomi1.showClearButton.value = false;
    denomi1.controller.clear();
    denomi1.value.value = 0;
    count.value = 0;
    appPreferences.setInt(AppPreferencesKeys.controllerValue2000, 0);
    appPreferences.setInt(AppPreferencesKeys.controllerValue500, 0);
    appPreferences.setInt(AppPreferencesKeys.controllerValue200, 0);
    appPreferences.setInt(AppPreferencesKeys.controllerValue100, 0);
    appPreferences.setInt(AppPreferencesKeys.controllerValue50, 0);
    appPreferences.setInt(AppPreferencesKeys.controllerValue20, 0);
    appPreferences.setInt(AppPreferencesKeys.controllerValue10, 0);
    appPreferences.setInt(AppPreferencesKeys.controllerValue5, 0);
    appPreferences.setInt(AppPreferencesKeys.controllerValue2, 0);
    appPreferences.setInt(AppPreferencesKeys.controllerValue1, 0);
  }

  void onChange2000(String val) {
    if (val.isNotEmpty) {
      denomi2000.showClearButton.value = true;
    } else {
      denomi2000.showClearButton.value = false;
    }
    final intVal = int.tryParse(val) ?? 0;
    denomi2000.value.value = intVal * denomi2000.amount;
    updateCount();
    appPreferences.setInt(AppPreferencesKeys.controllerValue2000, intVal);
  }

  void onClearTap2000() {
    denomi2000.controller.clear();
    denomi2000.value.value = 0;
    denomi2000.showClearButton.value = false;
    updateCount();
    appPreferences.setInt(AppPreferencesKeys.controllerValue2000, 0);
  }

  void onChange500(String val) {
    if (val.isNotEmpty) {
      denomi500.showClearButton.value = true;
    } else {
      denomi500.showClearButton.value = false;
    }
    final intVal = int.tryParse(val) ?? 0;
    denomi500.value.value = intVal * denomi500.amount;
    updateCount();
    appPreferences.setInt(AppPreferencesKeys.controllerValue500, intVal);
  }

  void onClearTap500() {
    denomi500.controller.clear();
    denomi500.value.value = 0;
    denomi500.showClearButton.value = false;
    updateCount();
    appPreferences.setInt(AppPreferencesKeys.controllerValue500, 0);
  }

  void onChange200(String val) {
    if (val.isNotEmpty) {
      denomi200.showClearButton.value = true;
    } else {
      denomi200.showClearButton.value = false;
    }
    final intVal = int.tryParse(val) ?? 0;
    denomi200.value.value = intVal * denomi200.amount;
    updateCount();
    appPreferences.setInt(AppPreferencesKeys.controllerValue200, intVal);
  }

  void onClearTap200() {
    denomi200.controller.clear();
    denomi200.value.value = 0;
    denomi200.showClearButton.value = false;
    updateCount();
    appPreferences.setInt(AppPreferencesKeys.controllerValue200, 0);
  }

  void onChange100(String val) {
    if (val.isNotEmpty) {
      denomi100.showClearButton.value = true;
    } else {
      denomi100.showClearButton.value = false;
    }
    final intVal = int.tryParse(val) ?? 0;
    denomi100.value.value = intVal * denomi100.amount;
    updateCount();
    appPreferences.setInt(AppPreferencesKeys.controllerValue100, intVal);
  }

  void onClearTap100() {
    denomi100.controller.clear();
    denomi100.value.value = 0;
    denomi100.showClearButton.value = false;
    updateCount();
    appPreferences.setInt(AppPreferencesKeys.controllerValue100, 0);
  }

  void onChange50(String val) {
    if (val.isNotEmpty) {
      denomi50.showClearButton.value = true;
    } else {
      denomi50.showClearButton.value = false;
    }
    final intVal = int.tryParse(val) ?? 0;
    denomi50.value.value = intVal * denomi50.amount;
    updateCount();
    appPreferences.setInt(AppPreferencesKeys.controllerValue50, intVal);
  }

  void onClearTap50() {
    denomi50.controller.clear();
    denomi50.value.value = 0;
    denomi50.showClearButton.value = false;
    updateCount();
    appPreferences.setInt(AppPreferencesKeys.controllerValue50, 0);
  }

  void onChange20(String val) {
    if (val.isNotEmpty) {
      denomi20.showClearButton.value = true;
    } else {
      denomi20.showClearButton.value = false;
    }
    final intVal = int.tryParse(val) ?? 0;
    denomi20.value.value = intVal * denomi20.amount;
    updateCount();
    appPreferences.setInt(AppPreferencesKeys.controllerValue20, intVal);
  }

  void onClearTap20() {
    denomi20.controller.clear();
    denomi20.value.value = 0;
    denomi20.showClearButton.value = false;
    updateCount();
    appPreferences.setInt(AppPreferencesKeys.controllerValue20, 0);
  }

  void onChange10(String val) {
    if (val.isNotEmpty) {
      denomi10.showClearButton.value = true;
    } else {
      denomi10.showClearButton.value = false;
    }
    final intVal = int.tryParse(val) ?? 0;
    denomi10.value.value = intVal * denomi10.amount;
    updateCount();
    appPreferences.setInt(AppPreferencesKeys.controllerValue10, intVal);
  }

  void onClearTap10() {
    denomi10.controller.clear();
    denomi10.value.value = 0;
    denomi10.showClearButton.value = false;
    updateCount();
    appPreferences.setInt(AppPreferencesKeys.controllerValue10, 0);
  }

  void onChange5(String val) {
    if (val.isNotEmpty) {
      denomi5.showClearButton.value = true;
    } else {
      denomi5.showClearButton.value = false;
    }
    final intVal = int.tryParse(val) ?? 0;
    denomi5.value.value = intVal * denomi5.amount;
    updateCount();
    appPreferences.setInt(AppPreferencesKeys.controllerValue5, intVal);
  }

  void onClearTap5() {
    denomi5.controller.clear();
    denomi5.value.value = 0;
    denomi5.showClearButton.value = false;
    updateCount();
    appPreferences.setInt(AppPreferencesKeys.controllerValue5, 0);
  }

  void onChange2(String val) {
    if (val.isNotEmpty) {
      denomi2.showClearButton.value = true;
    } else {
      denomi2.showClearButton.value = false;
    }
    final intVal = int.tryParse(val) ?? 0;
    denomi2.value.value = intVal * denomi2.amount;
    updateCount();
    appPreferences.setInt(AppPreferencesKeys.controllerValue2, intVal);
  }

  void onClearTap2() {
    denomi2.controller.clear();
    denomi2.value.value = 0;
    denomi2.showClearButton.value = false;
    updateCount();
    appPreferences.setInt(AppPreferencesKeys.controllerValue2, 0);
  }

  void onChange1(String val) {
    if (val.isNotEmpty) {
      denomi1.showClearButton.value = true;
    } else {
      denomi1.showClearButton.value = false;
    }
    final intVal = int.tryParse(val) ?? 0;
    denomi1.value.value = intVal * denomi1.amount;
    updateCount();
    appPreferences.setInt(AppPreferencesKeys.controllerValue1, intVal);
  }

  void onClearTap1() {
    denomi1.controller.clear();
    denomi1.value.value = 0;
    denomi1.showClearButton.value = false;
    updateCount();
    appPreferences.setInt(AppPreferencesKeys.controllerValue1, 0);
  }

  void getControllerValues() {
    final c2000 = appPreferences.getInt(AppPreferencesKeys.controllerValue2000);
    final c500 = appPreferences.getInt(AppPreferencesKeys.controllerValue500);
    final c200 = appPreferences.getInt(AppPreferencesKeys.controllerValue200);
    final c100 = appPreferences.getInt(AppPreferencesKeys.controllerValue100);
    final c50 = appPreferences.getInt(AppPreferencesKeys.controllerValue50);
    final c20 = appPreferences.getInt(AppPreferencesKeys.controllerValue20);
    final c10 = appPreferences.getInt(AppPreferencesKeys.controllerValue10);
    final c5 = appPreferences.getInt(AppPreferencesKeys.controllerValue5);
    final c2 = appPreferences.getInt(AppPreferencesKeys.controllerValue2);
    final c1 = appPreferences.getInt(AppPreferencesKeys.controllerValue1);

    denomi2000.controller.text = "${(c2000 == 0 ? "" : c2000) ?? ""}";
    denomi500.controller.text = "${c500 == 0 ? "" : c500 ?? ""}";
    denomi200.controller.text = "${c200 == 0 ? "" : c200 ?? ""}";
    denomi100.controller.text = "${c100 == 0 ? "" : c100 ?? ""}";
    denomi50.controller.text = "${c50 == 0 ? "" : c50 ?? ""}";
    denomi20.controller.text = "${c20 == 0 ? "" : c20 ?? ""}";
    denomi10.controller.text = "${c10 == 0 ? "" : c10 ?? ""}";
    denomi5.controller.text = "${c5 == 0 ? "" : c5 ?? ""}";
    denomi2.controller.text = "${c2 == 0 ? "" : c2 ?? ""}";
    denomi1.controller.text = "${c1 == 0 ? "" : c1 ?? ""}";

    denomi2000.value.value = (c2000 ?? 0) * (denomi2000.amount);
    denomi500.value.value = (c500 ?? 0) * (denomi500.amount);
    denomi200.value.value = (c200 ?? 0) * (denomi200.amount);
    denomi100.value.value = (c100 ?? 0) * (denomi100.amount);
    denomi50.value.value = (c50 ?? 0) * (denomi50.amount);
    denomi20.value.value = (c20 ?? 0) * (denomi20.amount);
    denomi10.value.value = (c10 ?? 0) * (denomi10.amount);
    denomi5.value.value = (c5 ?? 0) * (denomi5.amount);
    denomi2.value.value = (c2 ?? 0) * (denomi2.amount);
    denomi1.value.value = (c1 ?? 0) * (denomi1.amount);
    updateCount();
  }

  Future<void> saveToDatabase(String type, String? remarks) async {
    final db = await sqfLiteService.database;
    await db?.insert(
      "Denomination",
      {
        "type": type,
        "remarks": remarks ?? "",
        "amount": count.value,
        "dateTime": DateTime.now().toString(),
      },
    );
  }
}
