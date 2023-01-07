

class Exercise {
  final int? id;
  final String name;

  Exercise({this.id, required this.name});

  factory Exercise.fromMap(Map<String, dynamic> json) => new Exercise(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
