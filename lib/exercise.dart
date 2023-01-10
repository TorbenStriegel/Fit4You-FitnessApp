import 'dart:math';

class Exercise {
  final int? id;
  final String name;
  int difficulty = Random().nextInt(100) + 10;
  int repetitions = Random().nextInt(20) + 6;

  Exercise({this.id, required this.name});

  factory Exercise.fromMap(Map<String, dynamic> json) => new Exercise(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'difficulty': difficulty!,
      'repetitions': repetitions!,
    };
  }
}
