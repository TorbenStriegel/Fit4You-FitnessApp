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
  bool showCheckedExercises = true;
  bool sortABC = false;
  List<String> _exerciseAll = <String>[
    "zzzzz",
    "Übung1",
    "Übung2",
    "Übung4",
    "Übung3",
    "Übung5",
    "letzte Übung",
  ];
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Exercises"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        showCheckedExercises = !showCheckedExercises;
                      });
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                    ),
                    icon: Icon(
                      showCheckedExercises
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                      size: 24.0,
                    ),
                    label: Text('Checked Exercises'),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (!sortABC) {
                          sortABC = true;
                          _exerciseAll.sort(
                              (a, b) => a.toString().compareTo(b.toString()));
                        } else {
                          sortABC = false;
                          _exerciseAll.sort(
                              (b, a) => a.toString().compareTo(b.toString()));
                        }
                      });
                    },
                    icon: Icon(Icons.sort_by_alpha_sharp),
                  ),
                ],
              ),
              Flexible(child: _buildListToAddExercises())
            ],
          ),
        ));
  }

  Widget _buildListToAddExercises() {
    final _exercisePersonal = context
        .dependOnInheritedWidgetOfExactType<Configuration>()!
        .exercisePersonal;
    List<String> _exerciseAllCopy = [..._exerciseAll];
    showCheckedExercises
        ? null
        : _exerciseAllCopy
            .removeWhere((item) => _exercisePersonal.contains(item));
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

  Widget _checkbox(bool isInPersonalExerciseList, String exercise) {
    final _exercisePersonal = context
        .dependOnInheritedWidgetOfExactType<Configuration>()!
        .exercisePersonal;
    return Checkbox(value: isInPersonalExerciseList,
        onChanged: (value) {
          value = isInPersonalExerciseList;
          setState(() {
            if (isInPersonalExerciseList) {
              _exercisePersonal.remove(exercise);

            } else {
              _exercisePersonal.add(exercise);
            }

        });
    });
  }

  Widget _buildRowToAddExercises(String exercise) {
    final _exercisePersonal = context
        .dependOnInheritedWidgetOfExactType<Configuration>()!
        .exercisePersonal;
    bool isInPersonalExerciseList = _exercisePersonal.contains(exercise);
    return ListTile(
      title: Text(exercise),
      trailing: _checkbox(isInPersonalExerciseList, exercise),
      onTap: () {
        setState(() {
          if (isInPersonalExerciseList) {
            _exercisePersonal.remove(exercise);
            _checkbox(false, exercise);
          } else {
            _exercisePersonal.add(exercise);
            _checkbox(true, exercise);
          }
        });
      },
    );
  }
}
