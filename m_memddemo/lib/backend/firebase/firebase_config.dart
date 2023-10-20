import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAMTkiSD60nQ3u0h_v8iA-OXYTv7pP97hA",
            authDomain: "ff-ent-apac-cloud-summit-demos.firebaseapp.com",
            projectId: "ff-ent-apac-cloud-summit-demos",
            storageBucket: "ff-ent-apac-cloud-summit-demos.appspot.com",
            messagingSenderId: "800889875587",
            appId: "1:800889875587:web:9e4d8bcf505e72132dffb6",
            measurementId: "G-RHF37EGMMY"));
  } else {
    await Firebase.initializeApp();
  }
}
