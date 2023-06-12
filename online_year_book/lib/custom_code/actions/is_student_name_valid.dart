// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> isStudentNameValid(String firstName, String middleName,
    String lastName, StudentsRecord? studentToEdit) async {
  var query = await FirebaseFirestore.instance
      .collection("students")
      .where("first_name", isEqualTo: firstName)
      .where("middle_name", isEqualTo: middleName)
      .where("last_name", isEqualTo: lastName);

  if (studentToEdit != null) {
    var docId = studentToEdit.reference.id;
    if (!docId.isEmpty) {
      // Get the reference to the "users" collection
      query = await FirebaseFirestore.instance
          .collection("students")
          .where("first_name", isEqualTo: firstName)
          .where("middle_name", isEqualTo: middleName)
          .where("last_name", isEqualTo: lastName)
          .where(FieldPath.documentId, isNotEqualTo: docId);
    }
  }

  // Get the snapshot of the collection
  QuerySnapshot snapshot = await query.get();
  // Return the number of documents in the collection
  return snapshot.size <= 0;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
