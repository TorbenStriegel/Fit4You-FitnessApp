import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool test = true;
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: ExerciseGenerator());
  }
}

class ExerciseGenerator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExerciseName();
}

class _ExerciseName extends State<ExerciseGenerator> {
  List<String> _exercisePersonal = <String>[];
  List<String> _exerciseAll = <String>[
    "Übung1",
    "Übung2",
    "Übung3",
    "Übung4",
    "Übung5",
    "letzte Übung",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fit4You'),
      ),
      body:   Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text("data"),Flexible(child: _buildPersonalExercisesList()),
          TextButton(onPressed: () {_addExercise();},
              child: Text ("Add Exercise"))],
      )
    );
  }

  Widget _buildPersonalExercisesList() {
    return ListView.builder(
      itemCount: _exercisePersonal.length * 2,
      padding: EdgeInsets.all(16),
      itemBuilder: (context, i) {
        if (i.isOdd) {
          return Divider();
        }
        return _buildRowPersonalExercises(_exercisePersonal[i ~/ 2]);
      },
    );
  }

  Widget _buildRowPersonalExercises(String exercisePersonal) {
    return ListTile(
      title: Text(exercisePersonal),
      trailing: Icon(Icons.abc),
      onTap: () {
        setState(() {
          //_addexercise(_exercisePersonal);
        });
      },
    );
  }

  Widget _buildListToAddExercises() {
    List<String> _exerciseAllCopy = [..._exerciseAll];
    _exerciseAllCopy.removeWhere((item) => _exercisePersonal.contains(item));
    return ListView.builder(
      itemCount: _exerciseAllCopy.length * 2,
      padding: EdgeInsets.all(16),
      itemBuilder: (context, i) {
        if (i.isOdd) {
          return Divider();
        }
        return _buildRowToAddExercises(_exerciseAllCopy[i ~/ 2]);
      },
    );
  }

  Widget _buildRowToAddExercises(String exercise) {
    return ListTile(
      title: Text(exercise),
      trailing: Icon(Icons.abc),
      onTap: () {
        setState(() {
          _exercisePersonal.add(exercise);
        });
      },
    );
  }
  void _addExercise() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (BuildContext context) {
        return Scaffold (
          appBar: AppBar (
            title: Text("Add Exercise"),
          ),
          body: _buildListToAddExercises(),
        );
      }),
    );
  }
}

