// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_functions/cloud_functions.dart';

Future<bool> deleteStudentAccount(DocumentReference studentRef) async {
  var snapshot = await FirebaseFirestore.instance
      .collection("users")
      .where("student_profile", isEqualTo: studentRef)
      .get();

  if (snapshot.docs.isNotEmpty) {
    var document = snapshot.docs.first;
    var data = document.data();
    var uid = data['uid'];

    final deleteFunction =
        FirebaseFunctions.instance.httpsCallable('deleteUser');
    try {
      final result = await deleteFunction.call({'uid': uid});
      final data = result.data as Map<String, dynamic>;
      if (data['success'] == true) {
        print('User deleted successfully.');
        return true;
      } else {
        print('Failed to delete user.');
        return false;
      }
    } catch (e) {
      print('Error deleting user: $e');
      return false;
    }
  }

  return false;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
