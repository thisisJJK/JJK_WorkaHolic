import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workaholic/controllers/memo_controller.dart';
import 'package:workaholic/views/pages/bottom_pages/calender/memo/memo_item.dart';

class MemoListView extends StatefulWidget {
  const MemoListView({
    super.key,
  });

  //final RxList<MemoModel> itemList;

  @override
  State<MemoListView> createState() => _MemoListViewState();
}

class _MemoListViewState extends State<MemoListView> {
  final MemoController controller = Get.put(MemoController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => ListView.builder(
          itemCount: controller.memos.length,
          itemBuilder: (BuildContext context, int index) {
            final memo = controller.memos[index];
            return MemoItem(memo: memo);
          },
        ),
      ),
    );
  }
}
