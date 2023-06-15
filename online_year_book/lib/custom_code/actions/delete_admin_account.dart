// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_functions/cloud_functions.dart';

Future<String> deleteAdminAccount(DocumentReference userRef) async {
  var uid = userRef.id;

  final deleteFunction = FirebaseFunctions.instance.httpsCallable('deleteUser');
  try {
    final result = await deleteFunction.call({'uid': uid});
    final data = result.data as Map<String, dynamic>;
    if (data['success'] == true) {
      print('User deleted successfully.');
      return "Success";
    } else {
      print('Failed to delete user.');
      return data['error'];
    }
  } catch (e) {
    print('Error deleting user: $e');
    return 'Error deleting user: $e';
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
