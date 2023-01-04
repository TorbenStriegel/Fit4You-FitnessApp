import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  List<String> exercisePersonal;

  SecondPage({required List<String> this.exercisePersonal});

  @override
  State<StatefulWidget> createState() {
    return _SecondPageState(exercisePersonal);
  }
}

class _SecondPageState extends State<SecondPage> {
  List<String> exercisePersonal;
  List<String> _exerciseAll = <String>[
    "Übung1",
    "Übung2",
    "Übung3",
    "Übung4",
    "Übung5",
    "letzte Übung",
  ];
  bool isChecked = false;


  _SecondPageState(this.exercisePersonal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Exercises"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, exercisePersonal),
        ),
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
    bool isInPersonalExerciseList = exercisePersonal.contains(exercise);
    return ListTile(
      title: Text(exercise),
      trailing: _checkbox(isInPersonalExerciseList),

      /* Icon(
          isInPersonalExerciseList || isChecked ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.black), */
      onTap: () {
        setState(() {
          _checkbox(true);
          exercisePersonal.add(exercise);
        });
      },
    );
  }
}
