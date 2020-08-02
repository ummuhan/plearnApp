import 'package:englishapp/repository/user_repository.dart';
import 'package:englishapp/services/fake_auth_service.dart';
import 'package:englishapp/services/firebase_auth_service.dart';
import 'package:englishapp/services/firebase_storage_service.dart';
import 'package:englishapp/services/firestore_db_service.dart';
import 'package:get_it/get_it.dart';

//İsteklerimize bağlı olarak hangi veritabanına bağlanacağını belirler.

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<FirebaseAuthService>(
      FirebaseAuthService()); //İstekte bulunduğumuz durumda kayıt yapmamızı sağlat.
  locator.registerSingleton<FakeAuthenticationService>(
      FakeAuthenticationService());
  locator.registerSingleton<FirestoreDBService>(FirestoreDBService());
  locator.registerSingleton<FirebaseStorageService>(FirebaseStorageService());
  locator.registerSingleton<UserRepository>(UserRepository());
  

  //locator.registerLazySingleton(() => FirestoreDBService());
  // locator.registerLazySingleton(() => FirebaseStorageService());

  // locator.registerLazySingleton(()=>userRepository());
}
