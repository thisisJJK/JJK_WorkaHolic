import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:workaholic/models/spot_model.dart';

class SpotCardController extends GetxController {
  var spots = <SpotModel>[].obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    // 컨트롤러 생성될 때 바로 실행
    fetchSpots();
  }

  Future<void> fetchSpots() async {
    try {
      final snapshot = await _firestore.collection('spots').get();

      spots.value = snapshot.docs
          .map((doc) => SpotModel.fromMap(doc.id, doc.data()))
          .toList();

      // GetBuilder 사용시
      // update();
    } catch (e) {
      print('fetchSpots Error : $e ');
    }
  }

  Future<void> addSpots(String name, String wage) async {
    try {
      final doc = await _firestore.collection('spots').add({
        'name': name,
        'wage': wage,
      });
      if (name.isBlank!) {
        spots.add(SpotModel(id: doc.id, name: name, wage: wage));
        spots.refresh();
      } else {
        spots.refresh();
      }
    } catch (e) {
      print('addSpots Error : $e ');
    }
  }

  Future<void> updateSpots(String id, String name) async {
    try {
      await _firestore.collection('spots').doc(id).update({'name': name});
      final index = spots.indexWhere((spot) => spot.id == id);
      if (index != -1) {
        spots[index].name = name;
        spots.refresh();
      }
    } catch (e) {
      print('updateSpots Error : $e ');
    }
  }

  Future<void> deleteSpots(String id) async {
    try {
      await _firestore.collection('spots').doc(id).delete();
      spots.removeWhere((spot) => spot.id == id);
    } catch (e) {
      print('deleteSpots Error : $e ');
    }
  }
}
