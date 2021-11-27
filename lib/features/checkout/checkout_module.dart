import 'package:fluttercommerce/di/di.dart';
import 'package:fluttercommerce/features/app/firebase/firestore_repository.dart';
import 'package:fluttercommerce/features/checkout/bloc/add_to_cart_cubit.dart';
import 'package:fluttercommerce/features/checkout/bloc/cart_item_cubit.dart';
import 'package:fluttercommerce/features/checkout/bloc/cart_status_bloc.dart';
import 'package:fluttercommerce/features/checkout/bloc/payment_cubit.dart';
import 'package:fluttercommerce/features/checkout/bloc/place_order_cubit.dart';
import 'package:fluttercommerce/features/module.dart';

class CheckoutModule extends Module {
  @override
  void registerDependencies() {
    final firebaseRepo = DI.container<FirebaseManager>();
    DI.container
      ..registerFactory(() => AddToCartCubit(firebaseRepo))
      ..registerFactory(() => CartItemCubit(firebaseRepo))
      ..registerLazySingleton(() => CartStatusCubit())
      ..registerFactory(() => PaymentCubit())
      ..registerFactory(() => PlaceOrderCubit(firebaseRepo));
  }
}
