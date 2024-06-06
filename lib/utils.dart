
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled6/firebase_options.dart';
Future<void> SetupFirebase() async{
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
}