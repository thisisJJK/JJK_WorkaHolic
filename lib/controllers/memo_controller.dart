import 'package:get/get.dart';
import 'package:workaholic/models/memo/memo_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MemoController extends GetxController {
  var memos = <MemoModel>[].obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> fetchMemos(DateTime seleletedDay) async {
    try {
      final snapshot = await _firestore
          .collection('memos')
          .where('date',
              isEqualTo: seleletedDay.toIso8601String().substring(0, 10))
          .get(); //2000-01-01 형태로 비교해서 선택날짜의 메모 가져옴

      memos.value = snapshot.docs
          .map((doc) => MemoModel.fromMap(doc.id, doc.data()))
          .toList();
    } catch (e) {
      print('fetchMemos Error : $e ');
    }
  }

  Future<void> addMemos(String content, DateTime date) async {
    try {
      final doc = await _firestore.collection('memos').add({
        'content': content,
        'date': date.toIso8601String().substring(0, 10)
      });
      memos.add(MemoModel(id: doc.id, content: content, date: date));
    } catch (e) {
      print('addMemos Error : $e ');
    }
  }

  Future<void> updateMemos(String id, String content) async {
    try {
      await _firestore.collection('memos').doc(id).update({'content': content});
      final index = memos.indexWhere((memo) => memo.id == id);
      if (index != -1) {
        memos[index].content = content;
        memos.refresh();
      }
    } catch (e) {
      print('updateMemos Error : $e ');
    }
  }

  Future<void> deleteMemos(String id) async {
    try {
      await _firestore.collection('memos').doc(id).delete();
      memos.removeWhere((memo) => memo.id == id);
    } catch (e) {
      print('deleteMemos Error : $e ');
    }
  }
}
