import 'package:fit4you/config.dart';
import 'package:fit4you/secondPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool test = true;
    return Configuration(
      exercisePersonal: [],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.red,
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
          title: Text('Fit4You'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("data"),
            Flexible(child: _buildPersonalExercisesList()),
            TextButton(
                onPressed: () {
                  _addExercise();
                },
                child: Text("Add Exercise"))
          ],
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
      trailing: Icon(Icons.abc),
      onTap: () {
        _addExercise();
      },
    );
  }

  void _addExercise() {
    Navigator.push(
            context, MaterialPageRoute(builder: (context) => SecondPage()))
        .then((value) => setState(() {}));
  }
}
