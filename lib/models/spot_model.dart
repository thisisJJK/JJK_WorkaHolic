class SpotModel {
  String id;
  String name;
  String wage;

  SpotModel({
    required this.id,
    required this.name,
    required this.wage,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'wage': wage,
    };
  }

  factory SpotModel.fromMap(String id, Map<String, dynamic> map) {
    return SpotModel(id: id, name: map['name'], wage: map['wage']);
  }
}
