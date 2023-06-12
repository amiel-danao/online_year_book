import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBMaTVP6mkenItehCE1-fy7_36qlzinYqE",
            authDomain: "online-year-book.firebaseapp.com",
            projectId: "online-year-book",
            storageBucket: "online-year-book.appspot.com",
            messagingSenderId: "67938327347",
            appId: "1:67938327347:web:e77cbee19078543715fc46"));
  } else {
    await Firebase.initializeApp();
  }
}
