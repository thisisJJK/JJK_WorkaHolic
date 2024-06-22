import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workaholic/controllers/memo_controller.dart';
import 'package:workaholic/models/memo/memo_model.dart';

class MemoAddView extends StatelessWidget {
  final MemoModel? memo;
  final DateTime? date;
  final TextEditingController _textController;
  MemoAddView({super.key, this.memo, this.date})
      : _textController = TextEditingController(text: memo?.content ?? '');

  @override
  Widget build(BuildContext context) {
    final MemoController memoController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text(memo == null ? '메모 추가' : '메모 수정'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _textController,
            decoration: const InputDecoration(labelText: '메모 입력'),
            maxLines: null,
          ),
          ElevatedButton(
            onPressed: () {
              if (memo == null) {
                memoController.addMemos(_textController.text, date!);
              } else {
                memoController.updateMemos(memo!.id, _textController.text);
              }
              Get.back();
            },
            child: const Text('저장하기'),
          ),
        ],
      ),
    );
  }
}
