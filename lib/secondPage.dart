import 'dart:html';

import 'package:flutter/material.dart';


class SecondPage extends StatelessWidget {
  final String title;
  const SecondPage({Key? key, required this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    bool test = true;
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: secondPageExerciseGenerator());
  }
  }
class secondPageExerciseGenerator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExerciseName();
}

class _ExerciseName extends State<secondPageExerciseGenerator> {
  List<String> _exercisePersonal = <String>[];
  List<String> _exerciseAll = <String>[
    "Übung1",
    "Übung2",
    "Übung3",
    "Übung4",
    "Übung5",
    "letzte Übung",
  ];
  bool isChecked = false;

  get test => null;



  @override
  Widget build(BuildContext context) {
    return Scaffold (
        appBar: AppBar (
          title: Text("Add Exercise"),
        ),
        body: _buildListToAddExercises(),
    );
  }

  Widget _buildListToAddExercises() {
    List<String> _exerciseAllCopy = [..._exerciseAll];
    //_exerciseAllCopy.removeWhere((item) => _exercisePersonal.contains(item));
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

  Widget _checkbox(bool isInPersonalExerciseList) {
    return Checkbox (value: isInPersonalExerciseList, onChanged:(value) => { value = !isInPersonalExerciseList, print(value)});
  }



  Widget _buildRowToAddExercises(String exercise) {
    bool isInPersonalExerciseList = _exercisePersonal.contains(exercise);
    return ListTile(
      title: Text(exercise),
      trailing: _checkbox(isInPersonalExerciseList),

     /* Icon(
          isInPersonalExerciseList || isChecked ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.black), */
      onTap: () {
        setState(() {
          _checkbox(true);
          _exercisePersonal.add(exercise);
        });
      },
    );
  }
}

