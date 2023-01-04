import 'package:flutter/cupertino.dart';

class Configuration extends InheritedWidget {
  final List<String> exercisePersonal;

  Configuration({
    required this.exercisePersonal,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(Configuration oldWidget) {
    return exercisePersonal != oldWidget.exercisePersonal;
  }
}
