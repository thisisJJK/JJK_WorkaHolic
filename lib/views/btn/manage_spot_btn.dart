import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workaholic/views/pages/bottom_pages/home/cards/work_spot/work_spot_manage_view.dart';

class ManageSpotBtn extends StatelessWidget {
  const ManageSpotBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.to(() => WorkSpotManageView());
      },
      child: const Text('근무지 관리'),
    );
  }
}
