// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<int> getUsersCount() async {
  // Get the reference to the "users" collection
  CollectionReference usersRef = FirebaseFirestore.instance.collection('users');

  // Get the snapshot of the collection
  QuerySnapshot snapshot = await usersRef.get();

  // Return the number of documents in the collection
  return snapshot.size;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
