// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_functions/cloud_functions.dart';

Future<String> createUserAccount(
    String email, String password, String displayName, String photoUrl) async {
  final createFunction = FirebaseFunctions.instance.httpsCallable('createUser');

  try {
    final result = await createFunction.call({
      'email': email,
      'password': password,
      'display_name': displayName,
      'photo_url': photoUrl,
    });
    final data = result.data as Map<String, dynamic>?;

    if (data != null) {
      if (data['success'] == true) {
        print('User created successfully.');
        return "Success";
      } else {
        print('Failed to create user.');
        return data['error'];
      }
    } else {
      return 'Unknown error occured';
    }
  } catch (e) {
    print('$e');
    return '$e';
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
