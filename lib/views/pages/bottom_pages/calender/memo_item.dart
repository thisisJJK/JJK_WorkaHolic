import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workaholic/models/memo/memo_model.dart';
import 'package:workaholic/views/pages/bottom_pages/calender/memo_add_view.dart';

class MemoItem extends StatelessWidget {
  final MemoModel memo;
  const MemoItem({super.key, required this.memo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(memo.content),
      onTap: () {
        Get.to(() => MemoAddView(memo: memo));
      },
    );
  }
}
