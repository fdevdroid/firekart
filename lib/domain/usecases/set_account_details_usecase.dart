import 'package:fluttercommerce/data/repository/firebase_repository.dart';
import 'package:injectable/injectable.dart';

import '../models/account_details_model.dart';

@injectable
class SetAccountDetailsUseCase {
  SetAccountDetailsUseCase(this._firebaseRepository);

  final FirebaseRepository _firebaseRepository;

  Future<void> execute(AccountDetails accountDetails) {
    return _firebaseRepository.addUserDetails(accountDetails);
  }
}
