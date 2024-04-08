import 'package:auto_size_text/auto_size_text.dart';
import 'package:denomination/app/modules/home/views/confirmation_dialog.dart';
import 'package:denomination/app/modules/home/views/remark_dialog.dart';
import 'package:denomination/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

import '../../../core/helpers/number_helper.dart';
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
                    onChanged: controller.onChange2000,
                    onClearButtonTap: controller.onClearTap2000,
                    denomiModel: controller.denomi2000,
                  ),
                  DenomiItem(
                    onChanged: controller.onChange500,
                    onClearButtonTap: controller.onClearTap500,
                    denomiModel: controller.denomi500,
                  ),
                  DenomiItem(
                    onChanged: controller.onChange200,
                    onClearButtonTap: controller.onClearTap200,
                    denomiModel: controller.denomi200,
                  ),
                  DenomiItem(
                    onChanged: controller.onChange100,
                    onClearButtonTap: controller.onClearTap100,
                    denomiModel: controller.denomi100,
                  ),
                  DenomiItem(
                    onChanged: controller.onChange50,
                    onClearButtonTap: controller.onClearTap50,
                    denomiModel: controller.denomi50,
                  ),
                  DenomiItem(
                    onChanged: controller.onChange20,
                    onClearButtonTap: controller.onClearTap20,
                    denomiModel: controller.denomi20,
                  ),
                  DenomiItem(
                    onChanged: controller.onChange10,
                    onClearButtonTap: controller.onClearTap10,
                    denomiModel: controller.denomi10,
                  ),
                  DenomiItem(
                    onChanged: controller.onChange5,
                    onClearButtonTap: controller.onClearTap5,
                    denomiModel: controller.denomi5,
                  ),
                  DenomiItem(
                    onChanged: controller.onChange2,
                    onClearButtonTap: controller.onClearTap2,
                    denomiModel: controller.denomi2,
                  ),
                  DenomiItem(
                    onChanged: controller.onChange1,
                    onClearButtonTap: controller.onClearTap1,
                    denomiModel: controller.denomi1,
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
                      onTap: controller.clearAll,
                    ),
                    SpeedDialChild(
                      label: "Save",
                      child: const Icon(Icons.save_alt_rounded),
                      onTap: () {
                        _onFloatingSaveTap(context);
                      },
                    ),
                  ],
                );
        },
      ),
    );
  }

  void _onFloatingSaveTap(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return RemarksDialog(
          onSavePressed: (type, remarks) {
            showDialog(
              context: context,
              builder: (_) {
                return ConfirmationDialog(
                  positiveButtonText: "Yes",
                  negativeButtonText: "No",
                  title: "Confirmation",
                  subTitle: "Are you sure?",
                  onTapNegative: () {
                    Navigator.pop(context);
                  },
                  onTapPositive: () async {
                    Navigator.pop(context);
                    await controller.saveToDatabase(type, remarks);
                    if (context.mounted) Navigator.pop(context);
                    controller.clearAll();
                  },
                );
              },
            );
          },
        );
      },
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
