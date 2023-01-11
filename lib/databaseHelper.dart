import 'dart:io';

import 'package:fit4you/exercise.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// class to manage the database
class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  // Method, that opens the database
  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'exercises.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE exercises(
          id INTEGER PRIMARY KEY,
          name TEXT,
          difficulty INTEGER,
          repetitions INTEGER
      )
      ''');
  }
  // Method that returns all Exercises within the database table exercises
  Future<List<Exercise>> getExercises() async {
    Database db = await instance.database;
    var exercises = await db.query('exercises', orderBy: 'name');
    List<Exercise> exerciseList = exercises.isNotEmpty
        ? exercises.map((c) => Exercise.fromMap(c)).toList()
        : [];
    return exerciseList;
  }
  // Method to insert an Exercise to the database table exercises
  Future<int> add(Exercise item) async {
    Database db = await instance.database;
    return await db.insert("exercises", item.toMap());
  }
  // Method to remove an exercise from the database table exercises by id
  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete("exercises", where: "id = ?", whereArgs: [id]);
  }
  // Method to remove an exercise from the database table exercises by name
  Future<int> removeName(String name) async {
    Database db = await instance.database;
    return await db.delete("exercises", where: "name = ?", whereArgs: [name]);
  }
  // Method to remove all exercises from the database table exercises
  Future<int> removeAll() async {
    Database db = await instance.database;
    return await db.delete("exercises");
  }
  // mockup of all selectable excercises
  static List<String> exerciseAll() {
    return <String>[
      "Lunges",
      "Squats",
      "Crunches",
      "Pushups",
      "Mountain Climbers",
      "Burpee",
      "Deadlifts",
      "Sit-Ups",
      "Shrugs",
      "Side planks",
      "Hip Thrusts",
      "Dumbbell Pullover",
      "Shoulder Press",
      "Bench Press",
      "Biceps Curl",
      "Clean and Jerk",
    ];
  }
}
