import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workaholic/controllers/spot_card_controller.dart';
import 'package:workaholic/models/spot_model.dart';

class AddSpotBtn extends StatelessWidget {
  final SpotModel? spot;
  final TextEditingController _spotNameTextController;
  final TextEditingController _wageTextController;

  final SpotCardController spotCardController = Get.find();

  AddSpotBtn({super.key, this.spot})
      : _spotNameTextController = TextEditingController(text: spot?.name ?? ''),
        _wageTextController = TextEditingController(text: spot?.wage ?? '');

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        _addSpotDialog(context);
      },
      style: OutlinedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * 0.05),
      ),
      label: const Text('근무지 추가'),
      icon: const Icon(Icons.add),
    );
  }

  void _addSpotDialog(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('근무지 추가'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: _spotNameTextController,
                    decoration: const InputDecoration(hintText: '근무지 워커홀릭'),
                  ),
                  TextField(
                    controller: _wageTextController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: '시급'),
                  ),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      if (_spotNameTextController.text.isNotEmpty &&
                          _wageTextController.text.isNotEmpty) {
                        spotCardController.addSpots(
                            _spotNameTextController.text,
                            _wageTextController.text);
                        spotCardController.fetchSpots();
                        Get.back();
                      } else {
                        Get.back();

                        Get.snackbar('!', '내용이 없습니다.',
                            duration: const Duration(milliseconds: 1000),
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Colors.yellow[100]);
                      }
                    },
                    child: const Text('추가')),
                TextButton(
                    onPressed: () {
                      _spotNameTextController.clear();
                      _wageTextController.clear();
                      Get.back();
                    },
                    child: const Text('취소')),
              ],
            ));
  }
}
