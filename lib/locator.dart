import 'package:englishapp/repository/user_repository.dart';
import 'package:englishapp/services/fake_auth_service.dart';
import 'package:englishapp/services/firebase_auth_service.dart';

import 'package:englishapp/services/firestore_db_service.dart';
import 'package:get_it/get_it.dart';

//İsteklerimize bağlı olarak hangi veritabanına bağlanacağını belirler.

  GetIt locator=GetIt.instance;


void setupLocator(){
 
  locator.registerSingleton<FirebaseAuthService>(FirebaseAuthService());//(()=>firebaseAuthService());//İstekte bulunduğumuz durumda kayıt yapmamızı sağlat.
  locator.registerSingleton<FakeAuthenticationService>(FakeAuthenticationService());
  //yukardaki 2si çalışıyor user repo da çalışıyordu aslında
  locator.registerSingleton<FirestoreDBService>(FirestoreDBService());
   locator.registerSingleton<UserRepository>(UserRepository());
  

  // sorun yok gibi ya
  //locator.registerLazySingleton(() => FirestoreDBService());
 // locator.registerLazySingleton(() => FirebaseStorageService());

 // locator.registerLazySingleton(()=>userRepository());

}
