import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD9QEwEen87hmaDneUammZ2GyK4NAZJrXQ",
            authDomain: "lineleap-abc7a.firebaseapp.com",
            projectId: "lineleap-abc7a",
            storageBucket: "lineleap-abc7a.appspot.com",
            messagingSenderId: "1087648928600",
            appId: "1:1087648928600:web:a7e0ecd0b3d3a117f04b2d"));
  } else {
    await Firebase.initializeApp();
  }
}
