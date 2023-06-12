// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<String>> getAllSections() async {
  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('section');

  QuerySnapshot snapshot = await collectionRef.get();

  List<String> courseNames = snapshot.docs.map((doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return data['name'] as String;
  }).toList();

  return courseNames;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
