import 'package:fit4you/exercise.dart';
import 'package:flutter/cupertino.dart';

class Configuration extends InheritedWidget {
  final Future<List<Exercise>> exercisePersonal;

  Configuration({
    required this.exercisePersonal,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(Configuration oldWidget) {
    return exercisePersonal != oldWidget.exercisePersonal;
  }
}
