import 'package:fit4you/exercise.dart';
import 'package:flutter/cupertino.dart';

//Class for storing variables that are used on multiple pages.
// It is initialized when the app is started and can be accessed from all levels below.
class Configuration extends InheritedWidget {
  final Future<List<Exercise>> exercisePersonal;

  Configuration({
    required this.exercisePersonal,
    required Widget child,
  }) : super(child: child);

  //Notify all widgets that have subscribed to this when a change in data has occurred.
  @override
  bool updateShouldNotify(Configuration oldWidget) {
    return exercisePersonal != oldWidget.exercisePersonal;
  }
}
