import 'package:fluttercommerce/data/repository/firebase_repository.dart';
import 'package:injectable/injectable.dart';

import '../models/account_details_model.dart';

@injectable
class StreamAccountDetailsUseCaseUseCase {
  StreamAccountDetailsUseCaseUseCase(this._firebaseRepository);

  final FirebaseRepository _firebaseRepository;

  Stream<AccountDetails> execute() {
    return _firebaseRepository.streamUserDetails();
  }
}
