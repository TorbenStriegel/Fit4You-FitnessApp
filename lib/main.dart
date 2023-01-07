import 'package:fit4you/config.dart';
import 'package:fit4you/databaseHelper.dart';
import 'package:fit4you/exercise.dart';
import 'package:fit4you/secondPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Configuration(
      exercisePersonal: DatabaseHelper.instance.getExercises(),
      child: MaterialApp(
          title: 'Fit4You',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: firstPageExerciseGenerator()),
    );
  }
}

class _AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: const Duration(seconds: 1),
                content: Text("Cooming Soon"),
              ));
            },
            icon: Icon(Icons.person_pin),
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: const Duration(seconds: 1),
                content: Text("Cooming Soon"),
              ));
            },
            icon: Icon(Icons.accessibility),
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: const Duration(seconds: 1),
                content: Text("Cooming Soon"),
              ));
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),
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
        title: Text(textScaleFactor: 1.6, 'Fit4You'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(textScaleFactor: 1.8, "Your training plan"),
            Flexible(child: _buildPersonalExercisesList()),
            OutlinedButton(
              onPressed: () {
                _addExercise();
              },
              style: ButtonStyle(
                  side: MaterialStateProperty.all(
                      BorderSide(width: 1.5, color: Colors.blue)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  )),
              child: Text(textScaleFactor: 1.2, "edit exercises"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _AppBar(),
    );
  }

  Widget _buildPersonalExercisesList() {
    final _exercisePersonal = context
        .dependOnInheritedWidgetOfExactType<Configuration>()!
        .exercisePersonal;
    return FutureBuilder<List<Exercise>>(
        future: DatabaseHelper.instance.getExercises(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Exercise>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text("Loading..."),
            );
          }
          return snapshot.data!.isEmpty
              ? Center(
                  child: Text("No exercises selected"),
                )
              : ListView(
                  children: snapshot.data!.map(
                    (item) {
                      return _buildRowPersonalExercises(item);
                    },
                  ).toList(),
                );
        });
  }

  Widget _buildRowPersonalExercises(Exercise exercise) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: [
        IconSlideAction(
          caption: "Delete",
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            setState(() {
              DatabaseHelper.instance.remove(exercise.id!);
            });
          },
        ),
        IconSlideAction(
          caption: "Edit",
          color: Colors.grey,
          icon: Icons.edit,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: const Duration(seconds: 1),
              content: Text("Cooming Soon"),
            ));
          },
        )
      ],
      child: ListTile(
        title: Text(exercise.name),
      ),
    );
  }

  void _addExercise() {
    Navigator.push(
            context, MaterialPageRoute(builder: (context) => SecondPage()))
        .then((value) => setState(() {}));
  }
}
