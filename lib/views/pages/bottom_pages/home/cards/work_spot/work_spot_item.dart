import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workaholic/controllers/spot_card_controller.dart';
import 'package:workaholic/models/spot_model.dart';
import 'package:workaholic/views/pages/bottom_pages/home/cards/work_spot/wage_format.dart';

class WorkSpotItem extends StatelessWidget {
  final SpotModel spot;
  final SpotCardController _spotCardController = Get.find();
  final TextEditingController _spotNameTextController =
      Get.put(TextEditingController());
  final TextEditingController _wageTextController =
      Get.put(TextEditingController());

  WorkSpotItem({
    super.key,
    required this.spot,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        spot.name,
        style: const TextStyle(fontSize: 32, color: Colors.white),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      subtitle: Text(
        '${DateTime.now().month}월',
        style: const TextStyle(fontSize: 15, color: Colors.white),
      ),
      trailing: WageFormat(
        wage: int.parse(
          spot.toMap()['wage'].toString(),
        ),
      ),
      onTap: () =>
          spot.isBlank! ? _addSpotDialog(context) : _updateSpotDialog(context),
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
                        _spotCardController.addSpots(
                            _spotNameTextController.text,
                            _wageTextController.text);
                        _spotCardController.fetchSpots();
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

  void _updateSpotDialog(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('근무지 수정'),
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
                        _spotCardController.updateSpots(
                            _spotNameTextController.text,
                            _wageTextController.text);
                        _spotCardController.fetchSpots();
                        Get.back();
                      } else {
                        _spotCardController.deleteSpots(spot.id);
                        _spotCardController.fetchSpots();

                        Get.back();

                        Get.snackbar('!', '삭제되었습니다.',
                            duration: const Duration(milliseconds: 1000),
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Colors.yellow[100]);
                      }
                    },
                    child: const Text('수정')),
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
