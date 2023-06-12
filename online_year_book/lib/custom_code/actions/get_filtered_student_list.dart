// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<DocumentReference>> getFilteredStudentList(
    DocumentReference sectionRef,
    DocumentReference courseRef,
    int yearGraduated) async {
  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('students');

  QuerySnapshot snapshot = await collectionRef
      .where("year_graduated", isEqualTo: yearGraduated)
      .get();

  List<DocumentReference> filteredReferences = [];

  for (QueryDocumentSnapshot doc in snapshot.docs) {
    DocumentReference courseReference = doc.get('course') as DocumentReference;
    DocumentReference sectionReference =
        doc.get('section') as DocumentReference;

    // Replace 'desired_course_path' with the desired path to filter by
    if (courseReference.path == courseRef.path &&
        sectionReference.path == sectionRef.path) {
      filteredReferences.add(doc.reference);
    }
  }

  return filteredReferences;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
