// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/postgres/postgres.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

Future<String?> firebaseTokenRefresh() async {
  // refresh current user jwt from firebase and return the token
// Import necessary packages

// Get current user
  final user = FirebaseAuth.instance.currentUser;

// Refresh user token
  final idTokenResult = await user?.getIdTokenResult(true);

// Return refreshed token
  return idTokenResult!.token;
}
