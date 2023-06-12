// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> isCourseNameTaken(
    String courseName, CourseRecord? courseToEdit) async {
  // if (courseNameToEdit != null && courseName.compareTo(courseNameToEdit) == 0) {
  //   return false;
  // }
  var toEdit = "";
  if (courseToEdit != null) {
    toEdit = courseToEdit.name;
  }

  // Get the reference to the "users" collection
  var query = await FirebaseFirestore.instance
      .collection("course")
      .where("name", isEqualTo: courseName)
      .where("name", isNotEqualTo: toEdit);

  // Get the snapshot of the collection
  QuerySnapshot snapshot = await query.get();
  // Return the number of documents in the collection
  return snapshot.size > 0;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
