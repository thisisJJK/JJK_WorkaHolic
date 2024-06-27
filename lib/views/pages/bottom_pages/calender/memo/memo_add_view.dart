import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workaholic/controllers/memo_controller.dart';
import 'package:workaholic/controllers/selected_day_controller.dart';
import 'package:workaholic/models/memo_model.dart';

class MemoAddView extends StatelessWidget {
  final MemoModel? memo;
  final DateTime? date;
  final TextEditingController _textController;
  MemoAddView({super.key, this.memo, this.date})
      : _textController = TextEditingController(text: memo?.content ?? '');

  @override
  Widget build(BuildContext context) {
    final MemoController memoController = Get.find();
    final SelectedDayController selectedDayController =
        Get.put(SelectedDayController());

    return Scaffold(
      appBar: AppBar(
        title: Text(memo == null ? '메모 추가' : '메모 수정'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _textController,
            decoration: const InputDecoration(labelText: '메모 입력'),
            maxLines: null,
          ),
          ElevatedButton(
            onPressed: () {
              if (memo == null) {
                if (_textController.text.isEmpty) {
                  Get.back();
                  Get.snackbar('!', '내용이 없습니다.',
                      duration: const Duration(milliseconds: 1000),
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.yellow[100]);
                } else {
                  memoController.addMemos(_textController.text, date!);

                  selectedDayController.updateSelectedDay(
                      selectedDayController.selectedDay.value);
                  memoController
                      .fetchMemos(selectedDayController.selectedDay.value);
                  Get.back();
                }
              } else {
                memoController.updateMemos(memo!.id, _textController.text);
                if (_textController.text.isEmpty) {
                  memoController.deleteMemos(memo!.id);

                  Get.back();
                  Get.snackbar('!', '삭제되었습니다.',
                      duration: const Duration(milliseconds: 1000),
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.red[200]);
                } else {
                  Get.back();
                }
              }
            },
            child: const Text('저장하기'),
          ),
        ],
      ),
    );
  }
}
