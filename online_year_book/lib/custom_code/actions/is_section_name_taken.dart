// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> isSectionNameTaken(
    String sectionName, SectionRecord? sectionToEdit) async {
  var toEdit = "";
  if (sectionToEdit != null) {
    toEdit = sectionToEdit.name;
  }
  // Get the reference to the "users" collection
  var query = await FirebaseFirestore.instance
      .collection("section")
      .where("name", isEqualTo: sectionName)
      .where("name", isNotEqualTo: toEdit);

  // Get the snapshot of the collection
  QuerySnapshot snapshot = await query.get();
  // Return the number of documents in the collection
  return snapshot.size > 0;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
