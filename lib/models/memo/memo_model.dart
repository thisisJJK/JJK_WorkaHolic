class MemoModel {
  String id;
  String content;
  DateTime date;
  MemoModel({
    required this.id,
    required this.content,
    required this.date,
  });

  //메모 => 맵으로 변환
  //Firestore에 데이터 저장
  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'date': date.toIso8601String(),
    };
  }

  //맵 => 메모 변환
  //Firestore에서 데이터 가져옴
  factory MemoModel.fromMap(String id, Map<String, dynamic> map) {
    return MemoModel(
      id: id, //Firestore 문서 id => 메모 id
      content: map['content'], //맵에서 내용 추출
      date: DateTime.parse(map['date'] //맵에서 날짜 추출
          ),
    );
  }
}
