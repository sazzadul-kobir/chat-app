
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled6/firebase_options.dart';
import 'package:untitled6/services/auth_services.dart';
final GetIt getIt = GetIt.instance;

Future<void> SetupFirebase() async{
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
}

Future<void> registerServices() async{

   getIt.registerLazySingleton<AuthService>(() => AuthService());
}
