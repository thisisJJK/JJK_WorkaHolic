import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workaholic/controllers/spot_card_controller.dart';
import 'package:workaholic/views/pages/bottom_pages/home/cards/work_spot/work_spot_item.dart';

class WorkSpotManageView extends StatefulWidget {
  const WorkSpotManageView({super.key});

  @override
  State<WorkSpotManageView> createState() => _WorkSpotManageViewState();
}

class _WorkSpotManageViewState extends State<WorkSpotManageView> {
  final SpotCardController _spotCardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('근무지 관리'),
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: _spotCardController.spots.length,
            itemBuilder: (context, index) {
              final spot = _spotCardController.spots[index];
              return Card(
                color: Colors.blue,
                child: WorkSpotItem(
                  spot: spot,
                ),
              );
            }),
      ),
    );
  }
}
