import 'package:fluttercommerce/di/di.dart';
import 'package:fluttercommerce/features/app/firebase/crashlytics_service.dart';
import 'package:fluttercommerce/features/app/firebase/firestore_repository.dart';
import 'package:fluttercommerce/features/module.dart';

class AppModule extends Module {
  @override
  void registerDependencies() {
    DI.container.registerFactory(() => FirebaseManager());
    final firebaseManager = DI.container<FirebaseManager>();
    DI.container.registerFactory(() => CrashlyticsService(firebaseManager));
  }
}
