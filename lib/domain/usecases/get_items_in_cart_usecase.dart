import 'package:fluttercommerce/data/repository/firebase_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetItemsInCartUseCase {
  GetItemsInCartUseCase(this._firebaseRepository);

  final FirebaseRepository _firebaseRepository;

  Future<int> execute(String productId) {
    return _firebaseRepository.checkItemInCart(productId);
  }
}
