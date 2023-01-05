import 'package:fit4you/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return _SecondPageState();
  }
}

class _SecondPageState extends State<SecondPage> {
  List<String> _exerciseAll = <String>[
    "Übung1",
    "Übung2",
    "Übung3",
    "Übung4",
    "Übung5",
    "letzte Übung",
  ];
  bool isChecked = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Exercises"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
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
    return Checkbox(value: isInPersonalExerciseList,
        onChanged: (value) =>
        {
          value = !isInPersonalExerciseList,
          print(value)
        });
  }

  Widget _buildRowToAddExercises(String exercise) {
    final _exercisePersonal = context
        .dependOnInheritedWidgetOfExactType<Configuration>()!
        .exercisePersonal;
    bool isInPersonalExerciseList = _exercisePersonal.contains(exercise);
    return ListTile(
      title: Text(exercise),
      trailing: _checkbox(isInPersonalExerciseList),
      onTap: () {
        setState(() {
          if (isInPersonalExerciseList) {
            _exercisePersonal.remove(exercise);
            _checkbox(false);
          } else {
            _exercisePersonal.add(exercise);
            _checkbox(true);
          }
        });
      },
    );
  }
}
