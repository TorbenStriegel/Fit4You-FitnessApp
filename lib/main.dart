import 'package:fit4you/secondPage.dart';
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
        home: firstPageExerciseGenerator());
  }
}

class firstPageExerciseGenerator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExerciseName();
}

class _ExerciseName extends State<firstPageExerciseGenerator> {
  List<String> _exercisePersonal = <String>[];
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
                  setState(() {

                    _addExercise();
                  });
                },
                child: Text("Add Exercise"))
          ],
        ));
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
          _addExercise();
        });
      },
    );
  }


  _addExercise() async {
    print("Test" + _exercisePersonal.toString());
    final result =  Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                SecondPage(exercisePersonal: _exercisePersonal)));
    print (result);

    _exercisePersonal = await result;

  }
}
