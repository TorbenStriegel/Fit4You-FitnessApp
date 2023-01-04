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
  List<String> _exerciseNames = <String>[
    "Übung1",
    "Übung2",
    "Übung3",
    "Übung1",
    "Übung1",
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
        children: [Text("data"),Flexible(child: _buildBody())],
      )
    );
  }

  Widget _buildBody() {
    return ListView.builder(
      itemCount: _exerciseNames.length * 2,
      padding: EdgeInsets.all(16),
      itemBuilder: (context, i) {
        if (i.isOdd) {
          return Divider();
        }
        return _buildRow(_exerciseNames[i ~/ 2]);
      },
    );
  }

  Widget _buildRow(String exerciseName) {
    return ListTile(
      title: Text(exerciseName),
      trailing: Icon(Icons.abc),
      onTap: () {
        setState(() {
          _exerciseNames.sort();
        });
      },
    );
  }
}

