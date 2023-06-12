// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

List<String> generateYears() {
  int currentYear = DateTime.now().year;
  int startYear = 1990;

  List<String> years =
      List<String>.generate(currentYear - startYear + 1, (index) {
    int year = currentYear - index;
    return year.toString();
  });

  return years;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
