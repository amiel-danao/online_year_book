// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> getCourseNameByReference(String courseId) async {
  DocumentReference documentRef =
      FirebaseFirestore.instance.collection('course').doc(courseId);

  DocumentSnapshot snapshot = await documentRef.get();

  if (snapshot.exists) {
    return snapshot.get("name");
  }
  return "";
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
