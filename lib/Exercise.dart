import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Exercise {
  final int? id;
  final String name;

  Exercise({this.id,  required this.name});

  factory Exercise.fromMap(Map<String, dynamic> json) => new Exercise(
    id: json ['id'],
    name: json['name'],

  );

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'name':name,
    };
  }
}

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'exercises.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE exercises(
          id INTEGER PRIMARY KEY,
          name TEXT
      )
      ''');
  }

  Future<List<Exercise>> getExercises() async {
    Database db = await instance.database;
    var exercises = await db.query('exercises', orderBy: 'name');
    List<Exercise> exerciseList = exercises.isNotEmpty
        ? exercises.map((c) => Exercise.fromMap(c)).toList()
        : [];
    return exerciseList;
  }
}