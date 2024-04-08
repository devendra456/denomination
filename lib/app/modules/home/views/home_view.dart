import 'package:auto_size_text/auto_size_text.dart';
import 'package:denomination/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

import '../../../core/number_helper.dart';
import '../controllers/home_controller.dart';
import 'denomi_item.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DenomiItem(
                    amount: 2000,
                    controller: controller.textEditingController2000,
                    hintText: "Try 6",
                    onChanged: (int val) {
                      controller.count2000 = val;
                      controller.updateCount();
                    },
                  ),
                  DenomiItem(
                    controller: controller.textEditingController500,
                    amount: 500,
                    onChanged: (int val) {
                      controller.count500 = val;
                      controller.updateCount();
                    },
                  ),
                  DenomiItem(
                    controller: controller.textEditingController200,
                    amount: 200,
                    onChanged: (int val) {
                      controller.count200 = val;
                      controller.updateCount();
                    },
                  ),
                  DenomiItem(
                    controller: controller.textEditingController100,
                    amount: 100,
                    onChanged: (int val) {
                      controller.count100 = val;
                      controller.updateCount();
                    },
                  ),
                  DenomiItem(
                    controller: controller.textEditingController50,
                    amount: 50,
                    onChanged: (int val) {
                      controller.count50 = val;
                      controller.updateCount();
                    },
                  ),
                  DenomiItem(
                    controller: controller.textEditingController20,
                    amount: 20,
                    onChanged: (int val) {
                      controller.count20 = val;
                      controller.updateCount();
                    },
                  ),
                  DenomiItem(
                    controller: controller.textEditingController10,
                    amount: 10,
                    onChanged: (int val) {
                      controller.count10 = val;
                      controller.updateCount();
                    },
                  ),
                  DenomiItem(
                    controller: controller.textEditingController5,
                    amount: 5,
                    onChanged: (int val) {
                      controller.count5 = val;
                      controller.updateCount();
                    },
                  ),
                  DenomiItem(
                    controller: controller.textEditingController2,
                    amount: 2,
                    onChanged: (int val) {
                      controller.count2 = val;
                      controller.updateCount();
                    },
                  ),
                  DenomiItem(
                    controller: controller.textEditingController1,
                    amount: 1,
                    onChanged: (int val) {
                      controller.count1 = val;
                      controller.updateCount();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Obx(
        () {
          return controller.count.value == 0
              ? const SizedBox()
              : SpeedDial(
                  icon: Icons.electric_bolt_rounded,
                  children: [
                    SpeedDialChild(
                      label: "Clear",
                      child: const Icon(Icons.refresh),
                      onTap: () {
                        controller.clearAll();
                      },
                    ),
                    SpeedDialChild(
                      label: "Save",
                      child: const Icon(Icons.save_alt_rounded),
                      onTap: () {},
                    ),
                  ],
                );
        },
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 180.0,
      floating: false,
      pinned: true,
      actions: [
        PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: const Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(
                      Icons.history,
                      size: 18,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text("History"),
                  ],
                ),
                onTap: () {
                  Get.toNamed(Routes.HISTORY);
                },
              )
            ];
          },
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(16),
        title: Obx(
          () {
            return controller.count.value == 0
                ? const Text('Denomination')
                : SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Amount",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          "₹ ${formatNumberWithCommas(controller.count.value)}",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        AutoSizeText(
                          numberToChar(controller.count.value),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  );
          },
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/currency_banner.jpg',
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black38,
            ),
          ],
        ),
      ),
    );
  }
}
