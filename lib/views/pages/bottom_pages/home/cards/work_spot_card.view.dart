import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workaholic/controllers/spot_card_controller.dart';
import 'package:workaholic/views/pages/bottom_pages/home/cards/work_spot/work_spot_item.dart';

class WorkSpotCard extends StatelessWidget {
  final SpotCardController _spotCardController = Get.put(SpotCardController());
  WorkSpotCard({super.key});

  @override
  Widget build(BuildContext context) {
    _spotCardController.fetchSpots();
    return Obx(
      () => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.105,
        child: ListView.builder(
            physics: const PageScrollPhysics(),
            itemCount: _spotCardController.spots.length,
            itemBuilder: (context, index) {
              final spot = _spotCardController.spots[index];
              return Card(
                color: Colors.pink[100],
                child: WorkSpotItem(
                  spot: spot,
                ),
              );
            }),
      ),
    );
  }
}
