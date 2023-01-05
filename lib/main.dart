import 'package:fit4you/config.dart';
import 'package:fit4you/secondPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Configuration(
      exercisePersonal: [],
      child: MaterialApp(
          title: 'Fit4You',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: firstPageExerciseGenerator()),
    );
  }
}

class firstPageExerciseGenerator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExerciseName();
}

class _ExerciseName extends State<firstPageExerciseGenerator> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(textScaleFactor: 1.6,'Fit4You'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(textScaleFactor: 1.8,"Your training plan"),
              Flexible(child: _buildPersonalExercisesList()),
            OutlinedButton(
              onPressed: () {
                _addExercise();
              },
              style: ButtonStyle(
                side:MaterialStateProperty.all(BorderSide(width: 1.5,color: Colors.blue)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                )),
                child: Text(textScaleFactor: 1.2,"edit exercises"),
            ),
            ],
          ),
        ));
  }

  Widget _buildPersonalExercisesList() {
    final _exercisePersonal = context
        .dependOnInheritedWidgetOfExactType<Configuration>()!
        .exercisePersonal;
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
    );
  }

  void _addExercise() {
    Navigator.push(
            context, MaterialPageRoute(builder: (context) => SecondPage()))
        .then((value) => setState(() {}));
  }
}
