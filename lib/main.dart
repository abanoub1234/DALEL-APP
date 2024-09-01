import 'package:flutter/material.dart';
import 'app/dalel_app.dart';
import 'core/database/cache/cache_helper.dart';
import 'core/functions/check_state_changes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/services/service_locator.dart';


Future<void> main() async
{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyCliG-sqakmKqW_bOSFKopm0kW-k5j6DeI",
        authDomain: "dalel-app-12565.firebaseapp.com",
        projectId: "dalel-app-12565",
        storageBucket: "dalel-app-12565.appspot.com",
        messagingSenderId: "515197671723",
        appId: "1:515197671723:web:269a6f9c2cd165c6b68d6e",
        measurementId: "G-7E7EDW870B"
    ),
  );

  setupServiceLocator();
  await getIt<CacheHelper>().init();
  checkStateChanges();
  runApp(Dalel());
}






