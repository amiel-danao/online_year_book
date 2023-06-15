// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> isAdminUserNameValid(
    String username, UsersRecord? userToEdit) async {
  var query = await FirebaseFirestore.instance
      .collection("users")
      .where("display_name", isEqualTo: username);

  if (userToEdit != null) {
    var docId = userToEdit.reference.id;
    if (!docId.isEmpty) {
      // Get the reference to the "users" collection
      query = await FirebaseFirestore.instance
          .collection("users")
          .where("display_name", isEqualTo: username)
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
