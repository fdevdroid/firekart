import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/state/result_state.dart';
import '../../../../di/di.dart';
import '../../../../domain/models/product_model.dart';
import '../../../../res/string_constants.dart';
import '../../../routes/app_router.gr.dart';
import '../../../routes/navigation_handler.dart';
import '../../../widgets/common_app_loader.dart';
import '../../../widgets/product_card.dart';
import '../../../widgets/result_api_builder.dart';
import '../view_model/all_product_cubit.dart';

class AllProductListScreen extends StatefulWidget {
  const AllProductListScreen({Key? key, this.productCondition}) : super(key: key);

  final String? productCondition;

  @override
  _AllProductListScreenState createState() => _AllProductListScreenState();
}

class _AllProductListScreenState extends State<AllProductListScreen> {
  var allProductsCubit = inject<AllProductCubit>();
  ScrollController controller = ScrollController();

  @override
  void initState() {
    allProductsCubit.fetchProducts(widget.productCondition);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringsConstants.allProducts),
        actions: <Widget>[
          InkWell(
            onTap: () {
              NavigationHandler.navigateTo(const SearchItemScreenRoute());
            },
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(Icons.search),
            ),
          )
        ],
      ),
      body: BlocConsumer<AllProductCubit, ResultState<List<Product>>>(
        bloc: allProductsCubit,
        listener: (BuildContext context, ResultState<List<Product>> state) {},
        builder: (BuildContext context, ResultState<List<Product>> state) {
          return ResultStateBuilder(
            state: state,
            loadingWidget: (bool isReloading) {
              return const Center(
                child: CommonAppLoader(),
              );
            },
            errorWidget: (String error) {
              return Container();
            },
            dataWidget: (List<Product> value) {
              return dataWidget(value);
            },
          );
        },
      ),
    );
  }

  Widget dataWidget(List<Product> productList) {
    return GridView.builder(
      controller: controller,
      itemCount: productList.length,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 30),
      itemBuilder: (BuildContext context, int index) {
        return ProductCard(productModelToArgs(productList[index]));
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10,
      ),
    );
  }

  ProductCardArgs productModelToArgs(Product productModel) {
    return ProductCardArgs(
      image: productModel.image!,
      name: productModel.name!,
      currency: productModel.currency!,
      onTap: () {
        NavigationHandler.navigateTo(
          ProductDetailPageRoute(
            product: productModel,
          ),
        );
      },
      actualPrice: productModel.actualPrice!,
      currentPrice: productModel.currentPrice!,
      quantityPerUnit: productModel.quantityPerUnit!,
      unit: productModel.unit!,
    );
  }
}
