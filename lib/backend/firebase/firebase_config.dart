import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAj3jGOKETTd0AIV7NbfedFs5h01-pxFkM",
            authDomain: "oiko-oficial-45p72k.firebaseapp.com",
            projectId: "oiko-oficial-45p72k",
            storageBucket: "oiko-oficial-45p72k.appspot.com",
            messagingSenderId: "79750402309",
            appId: "1:79750402309:web:cee7322999d87d8a62e76c"));
  } else {
    await Firebase.initializeApp();
  }
}
